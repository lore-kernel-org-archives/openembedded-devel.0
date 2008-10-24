Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KtMsz-0007gy-CF
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 15:39:29 +0200
Received: by wf-out-1314.google.com with SMTP id 29so969909wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2008 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ywavYTyr7tZ1bjAs2xWCcgYIYhd3fqDltcYC+fLqDKY=;
	b=t2oPxg5uihAjsPslPyD05SLeURgft3HDemZMfc7uOODMrulT8twlHUgmr8PsiSsa2F
	3boD1llggcDLQljwZW20yhaEXr0Sh/Z5QIGNwa3qsFW0IEsMdeyU+0XPRIQMRn8LJ+ia
	I0pxwkZDmYW0fJ/Z+WoYEw8cu9DRznrz3RfiE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=P270to+RUhs8ZNNZJYJiWbXdy/am33/OO2Mrhnq4n665tmLDoaXp3BCscjv+xSFp+8
	M82IPDIe6DMvRxZTwJrc68iNhl2Vaz2MJdty5bxsYhUNWfNuHlwbzMDmke5fBjHjWIMs
	ef5FnKav3MxfA8cjH17Atd2i8NuauNOtSzED0=
Received: by 10.141.122.1 with SMTP id z1mr1182472rvm.161.1224855533625;
	Fri, 24 Oct 2008 06:38:53 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Fri, 24 Oct 2008 06:38:53 -0700 (PDT)
Message-ID: <f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
Date: Fri, 24 Oct 2008 09:38:53 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081023230928.GA21151@denix.org>
MIME-Version: 1.0
References: <20081023230928.GA21151@denix.org>
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
X-List-Received-Date: Fri, 24 Oct 2008 13:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Oct 23, 2008 at 7:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Hi,
>
> I'd like to propose to add http_proxy and ftp_proxy environment variables to
> BitBake's white list of preserved environment variables. They are usually set
> to be used by fetching tools like wget for users behind a firewall/proxy.
> Thanks.

In my latest tests, it does not seem like http_proxy is used by the bb
fetcher even when it is included in BB_ENV_EXTRAWHITE.  Has anyone
else seen this?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


