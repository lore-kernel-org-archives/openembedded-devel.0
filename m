Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAMT-0005uR-32
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:28:49 +0100
Received: by mail-iw0-f175.google.com with SMTP id 42so7638257iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VEivbsJrYNkoKqrFgX2FbUqh5VlO+9J9Q4lmSLNF8+I=;
	b=FyQyE85bSY9+96XcoV6F0d15d9t2Ls5Le22eVvdR1yvNz9KuVgUQznlHkWSOhWHoQ/
	94zvkUHoTeAdQO+El4JINaWfttQ5N1E9Y+jC749a1K0moN9trZYS4U0K8wkdrSjOeuDh
	ohlBeo0XNvjvSKRhJOJNEHZnzvOT6ZH2yDnYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MWti//SzgrjoctKYVQlYNszlXPiRHzUV6RpNzl4TpmE4r/NywLREdTbZICKCvumiJc
	GZMU+dnmZAszHjleLE/qEbFM368V/jxp49JemhZmAnfDB+BLKxUgLD1unfPonbv+MmW6
	plDy1SsscsDC5O8SMwT7zcZcbyGZetOn0lvs0=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr14501186ibb.51.1288679281746; Mon,
	01 Nov 2010 23:28:01 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:28:01 -0700 (PDT)
In-Reply-To: <AANLkTim+Cn4ivUT7Hfgers1EUNP-0HzyE9Mi9uz=cirf@mail.gmail.com>
References: <1288647332-20685-1-git-send-email-eric@eukrea.com>
	<AANLkTim+Cn4ivUT7Hfgers1EUNP-0HzyE9Mi9uz=cirf@mail.gmail.com>
Date: Tue, 2 Nov 2010 07:28:01 +0100
Message-ID: <AANLkTinw-gbQN0U+t_arT9bHjEZ_LYE2oN6OFfSTRa1K@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] busybox-static: add the latest version
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
X-List-Received-Date: Tue, 02 Nov 2010 06:28:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Khem Raj <raj.khem@gmail.com>:
> On Mon, Nov 1, 2010 at 2:35 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>> tested using initramfs-image
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/busybox/busybox-static_1.17.3.bb | =A0 11 +++++++++++
>> =A01 files changed, 11 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/busybox/busybox-static_1.17.3.bb
>>
>> diff --git a/recipes/busybox/busybox-static_1.17.3.bb b/recipes/busybox/=
busybox-static_1.17.3.bb
>> new file mode 100644
>> index 0000000..325752a
>> --- /dev/null
>> +++ b/recipes/busybox/busybox-static_1.17.3.bb
>> @@ -0,0 +1,11 @@
>> +require busybox_${PV}.bb
>> +PR =3D "${INC_PR}.0"
>> +
>> +FILESPATHPKG =3D. "busybox-${PV}:"
>> +S =3D "${WORKDIR}/busybox-${PV}"
>> +
>> +do_configure_append() {
>> + =A0 =A0 =A0 sed -i -e '/CONFIG_STATIC/d' .config
>> + =A0 =A0 =A0 echo "CONFIG_STATIC=3Dy" >>.config
>> +}
>> +
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


