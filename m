Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPus-0002YZ-Iu
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:49:25 +0100
Received: by ewy24 with SMTP id 24so4867957ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7+DyvDaUSbAi+2sseN0aw8hRqoteZ4XnhVbawuAQ5uQ=;
	b=hN7tNaBPekeUdpGSv1VH8e6XAUAd0jAunEfJYCrU/6CC4EPVXtcB1kAxUsVHfgZDOq
	2Vmdu1aDCUedutFklLWw8IDhfWFerPTz5mQpcIF6obdsPualXuAaSrr/IdtltvDRZVRc
	DylF9HAVDBKEnNCId/f3waoAardfixCcoOhhE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CFBLTJBqyeGaJttuhAxk10gowCE1LsQhkagWqS0OXZPYN1h7FHHLm8gZ3+8foz4Dau
	A6exVQfrG45ohX+/GOFOKgEoeI+tg8X0lRwpEXtbDwwdyLQERFkFqciV8sDDm0WO25OO
	wK9yaFACeOSNOqZ9AgdHNevTv0gwfRoF5g9yU=
MIME-Version: 1.0
Received: by 10.213.25.67 with SMTP id y3mr6063787ebb.48.1260139661151; Sun, 
	06 Dec 2009 14:47:41 -0800 (PST)
In-Reply-To: <1260133938.6896.2.camel@lenovo.internal.reciva.com>
References: <c384c5ea0912061249g6201f0adwc6ff58ff20d68331@mail.gmail.com>
	<1260133938.6896.2.camel@lenovo.internal.reciva.com>
Date: Sun, 6 Dec 2009 23:47:41 +0100
Message-ID: <c384c5ea0912061447v22a53b90jc71a893e0ac067ec@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] toolchain team question about libiberty.a
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
X-List-Received-Date: Sun, 06 Dec 2009 22:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Dec 6, 2009 at 10:12 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2009-12-06 at 21:49 +0100, Leon Woestenberg wrote:
>> can we safely remove this from gcc/gcc-configure-cross.inc?
>>
>> do_stage_append () {
>> =A0 =A0 =A0 =A0 ...
>> =A0 =A0 =A0 =A0 # We use libiberty from binutils
>> =A0 =A0 =A0 =A0 rm -f ${CROSS_DIR}/lib/libiberty.a
>> =A0 =A0 =A0 =A0 ...
>
> Yes, I think those two lines are bogus and can/should be deleted.
>
After further discussion on #irc, the commit is here:
b3312705e639262b3b83017897cd3056b22e8912

(Just in case our analysis was way off and if this needs quick revertion.)

Regards,
--=20
Leon


