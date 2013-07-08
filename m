Return-Path: <net147@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE0E6B038
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 05:26:53 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ia10so3017383vcb.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2013 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=c6qHuHW5eis4ewl8Tcf86KZDVwn8dZvtNDWK3KITkXs=;
	b=ZSslrKqW5HqsF0ZPUPsbIM1tmaNbujWkx7ujAO/Ytub2ZkMeNkRetFfWJ9zUw/SEnd
	cCWhsw6RKcIvVu+Q7KBiSZT451cIwMpDePm1wT+hc6S2Jo+dq3n1ZPKysaJsPy2OJo6s
	ucQoCTX2wfWN1STwDLUbE2ff9jgblGzwYhuRYsBTJGvGr7md0YnmrTaZ82ShrkNp1w2K
	NFQG2xIFwBSknWy4ceft9oBUE30NcLDjsMr1suemBvgmBuSQ7eC7voMOwteYbv92PssH
	QAkUR/Rxwd26v5FuAHZGqHZX7F7T7HBsBnGrxczl2JUQhm08hVVn5bwZwWsqYfSKtsl/
	I34A==
MIME-Version: 1.0
X-Received: by 10.52.21.196 with SMTP id x4mr2481195vde.65.1373261213511; Sun,
	07 Jul 2013 22:26:53 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Sun, 7 Jul 2013 22:26:53 -0700 (PDT)
In-Reply-To: <20130707162010.GH3288@jama>
References: <1373112225-2084-1-git-send-email-net147@gmail.com>
	<20130707162010.GH3288@jama>
Date: Mon, 8 Jul 2013 15:26:53 +1000
Message-ID: <CANwerB3oge_sbPa9Aik5cLCFWa8sTASd7uOForL4aLSU=4iT3w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] samba: remove /var/run from package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 05:26:53 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2013 02:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Jul 06, 2013 at 10:03:45PM +1000, Jonathan Liu wrote:
>> The /var/run and /var/run/lock directories are already created by
>> base-files.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> index a27a28c..6bd6644 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
>> @@ -57,3 +57,8 @@ do_configure() {
>>  do_compile () {
>>      base_do_compile
>>  }
>> +
>> +do_install_append() {
>> +    rm -rf "${D}${localstatedir}/run"
>
> Seems like lock removal is missing here.
>
> samba-3.6.8: samba: Files/directories were installed but not shipped
>   /run
>   /run/lock
>
> Thanks a lot for this patchset, now with libdir and infodir QA checks
> we'll see a lot more QA issues in world builds, so it's great to have
> this /run gone.
>
I have submitted V2 patch for samba. I haven't got around to fixing
nostromo yet.

Regards,
Jonathan

>
>> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>> +}
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

