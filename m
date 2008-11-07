Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KyXUS-00018O-UT
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Nov 2008 20:59:33 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1576391rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2008 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=GZKohbXLjbM4CgdA6kKpop88u1jeKJyonoXgHdpMwvU=;
	b=qPLldoxlkrACxcp5zuCyR9J7eR/qsN28/X1+vhHR28LV6/dE23/7LOW/ByNyd6/nlY
	AHvM/ZHCuCJI0HGOlF62bnzPT7bWEuskBqgIPFZwBAfwkJM47rMSXgTboSKPmDmdX+x2
	tu5xcFrCwTzSvzzXxCLadESAdSq08yeA3bi/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=q1JBGNfWMXNeNTUDWXWOMGNWeUOAxLsAUykUd0tJCpYzLgxOo+3WzJUdQyCYVfvGwx
	Gujg/qUA2UHwHFhhhG2jqXYzGwkxTO4l9jivXlq1D5Vi8wzyi9d1MVpbVvA8QshcfBLj
	9o+/fDLJ+rj/YMrjpq2Z3jw45DHU4ot5KqlhQ=
Received: by 10.141.3.17 with SMTP id f17mr1981792rvi.130.1226087874895;
	Fri, 07 Nov 2008 11:57:54 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Fri, 7 Nov 2008 11:57:54 -0800 (PST)
Message-ID: <f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
Date: Fri, 7 Nov 2008 14:57:54 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224861430.6356.20.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: Add http_proxy and ftp_proxy to BitBake white list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Nov 2008 19:59:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

In Fri, Oct 24, 2008 at 10:17 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
> On Fri, 2008-10-24 at 09:38 -0400, Cliff Brake wrote:
>> On Thu, Oct 23, 2008 at 7:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > Hi,
>> >
>> > I'd like to propose to add http_proxy and ftp_proxy environment variables to
>> > BitBake's white list of preserved environment variables. They are usually set
>> > to be used by fetching tools like wget for users behind a firewall/proxy.
>> > Thanks.
>>
>> In my latest tests, it does not seem like http_proxy is used by the bb
>> fetcher even when it is included in BB_ENV_EXTRAWHITE.  Has anyone
>> else seen this?
>
> Yes, I've just added some extra support for this to the bitbake in Poky.
> I'll aim to get that (and some other changes) pushed upstream this
> weekend.

Richard,

I've attempted to merge your patches and test, but the http_proxy is
still not preserved for wget.  A few notes:

wget does not pass through runfetchcmd() so exportvars stuff never
gets called there.

try_mirror also has some http_proxy stuff, but it does not appear to
be used by wget.

wget.py looks at HTTP_PROXY, but why HTTP_PROXY vs http_proxy?  If I
set HTTP_PROXY in local.conf, it then works.

So, is the idea the user has to set HTTP_PROXY in a conf file for wget
proxy to work?  What are the downsides to using http_proxy from the
environment?  At any rate, it seems like we have some inconsistencies
in the various fetcher methods.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


