Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PvEGR-0006Xm-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 20:32:44 +0100
Received: from source ([209.85.220.170]) (using TLSv1) by
	na3sys009aob105.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW/sdSar0zgfWkLjCwjqsE5p8+b91BUQ@postini.com;
	Thu, 03 Mar 2011 11:31:17 PST
Received: by mail-vx0-f170.google.com with SMTP id 39so1312271vxb.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2011 11:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=73xzihe6xIgUYyBP50iF9eaQ39uRgz7rEpe+sXOSceI=;
	b=Cz6hn4uwVAoagz7ovPgdys7otf2CoTTcCe6KiwpS7v73Ioh/mCLSjaV9AzuN+U72yf
	WSIiIH0wYzRmbICQn2qu41RkcgIdBzh9ppYo8WvPeLlvpO2/yMOpSrRC4bgO1u9As8e4
	9Q43yS5OByfhPELOlV5KhA+aI6Fmz9NYmwexM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=O9HyiT0IIELWE0AV8IqQpuVO4npMoCyzLdXkaU0MKnemNhPh8RN9AptBwbv1FDQKu0
	MZX86ncCeSe0jExyUVL76DDYNnjmbCZZ3HkdcZT+klhvM8ksaDh112CXvLQ38x4x6V+Y
	qFiM2bFS0morFg9sXjnedwe6aKQsBV/1P93As=
MIME-Version: 1.0
Received: by 10.52.160.8 with SMTP id xg8mr2195044vdb.264.1299180349917; Thu,
	03 Mar 2011 11:25:49 -0800 (PST)
Received: by 10.52.167.193 with HTTP; Thu, 3 Mar 2011 11:25:49 -0800 (PST)
In-Reply-To: <20110303182520.GC16888@denix.org>
References: <20110303173224.GA16888@denix.org>
	<1299176333-16449-1-git-send-email-bengardiner@nanometrics.ca>
	<20110303182520.GC16888@denix.org>
Date: Thu, 3 Mar 2011 14:25:49 -0500
Message-ID: <AANLkTikjGSdeiGh97330QhoUoVJ4CsC38n6WAdrpOpUf@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Denys Dmytriyenko <denis@denix.org>
Cc: arago-devel@gforge.ti.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] external-toolchain-csl: allow gdbserver
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
X-List-Received-Date: Thu, 03 Mar 2011 19:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Denys,

On Thu, Mar 3, 2011 at 1:25 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Mar 03, 2011 at 01:18:53PM -0500, Ben Gardiner wrote:
>> If PREFERRED_PROVIDER_gdbserver is not empty then don't PROVIDE or
>> install the gdbserver packaged with the CSL toolchain.
>>
>> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> ---
>>
>> Changes since v1:
>> =A0* test whether PREFERRED_PROVIDER_gdbserver is blank, not
>> =A0 =A0whether it is set to external-toolchain-csl. The latter results
>> =A0 =A0in a circular dependency when nothing is set, as it is in oe
>> =A0 =A0master w/o arago
>
> NAK. external-toolchain-csl should not depend on external gdbserver, if i=
t
> doesn't package it's own. That's how I have it in my patch, which I'm pus=
hing
> now, after testing it with different setups.

Good idea.

I tested your commit df59f77a2eb37d9807c6d9167488110e92601d7b in arago
and openembedded master -- builds are successful in both.

Thanks for the mention in your commit message and especially for your
continued maintenance and direction of the arago project.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


