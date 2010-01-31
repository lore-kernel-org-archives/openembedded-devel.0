Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbSqO-0006SO-Mc
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 06:59:39 +0100
Received: by pxi9 with SMTP id 9so2958928pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 21:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=GwNfLs3VXhRwhgaDyVzZBgpKTWZ0FZ9IJTUfD62v2OI=;
	b=mgTqT0bh4W/AkczsW84moVEYdFVL07tvdoSdOBDk7/gzgiw3UDXKNZu/mOClaPIlIT
	y7nziuemVKRzNisclS3SIiE1PHIT+oEYDtVlnhWsqwaQD98ibBZ7jmOLer8gp/s7i3yF
	Ky6d2VMboB4LSYVdKzXs42dFUkCyN1P27fgQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=VipKO2XYDoDSbDCS/kDLO9GniVXtJqMlswrhnMTnJEVEstvzeit9/O++vRATCGVu5x
	JYixc3Wm/nxbaXgaEGu30j+o8jRyQlUM4Kr5ZzJrD/Z2pJh1qLsoqf8xQ8p/mWFj6boI
	LaeTbwToyKKYCGZ+jiid3hV0+Arn9cYGVB1vA=
Received: by 10.142.61.33 with SMTP id j33mr1984809wfa.61.1264917429436;
	Sat, 30 Jan 2010 21:57:09 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3231657pzk.14.2010.01.30.21.57.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 21:57:08 -0800 (PST)
To: "Guo Hongruan" <camelguo@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <op.u7dmmldamn1qzu@camelguo>
	<19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
	<op.u7dt8jyhmn1qzu@camelguo>
Date: Sun, 31 Jan 2010 13:56:58 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dus8qwmn1qzu@camelguo>
In-Reply-To: <op.u7dt8jyhmn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 05:59:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Sun, 31 Jan 2010 13:44:33 +0800=EF=BC=8CGuo Hongruan <camelguo=
@gmail.com> =E5=86=99=E9=81=93:

> =E5=9C=A8 Sun, 31 Jan 2010 13:22:16 +0800=EF=BC=8CKhem Raj <raj.khem@g=
mail.com> =E5=86=99=E9=81=93:
>
>> in your build tree check where liblua5.1.a is installed and then
>> go from there.
>
> instead of liblue5.1.a, I found libua.a on my build tree. Maybe it is =
 =

> the cause of the error.
>
> ./armv5te-oe-linux-gnueabi/lib/liblua.a
>

I found it, it is caused by
1. lua5.1_5.1.4.bb install lib/liblua. to staging directory;
2. but piccoontrol_0.4.bb tries to link liblua5.1.a, which name is  =

liblua.a.
    20 LDFLAGS +=3D " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl "=


changing piccontrol_0.4.bb may correct the error.

diff --git a/recipes/piccontrol/piccontrol_0.4.bb  =

b/recipes/piccontrol/piccontrol_0.4.bb
index cfdef98..854f156 100644
--- a/recipes/piccontrol/piccontrol_0.4.bb
+++ b/recipes/piccontrol/piccontrol_0.4.bb
@@ -17,7 +17,7 @@ inherit update-rc.d
  INITSCRIPT_NAME =3D "piccontrol"
  INITSCRIPT_PARAMS =3D "defaults"

-LDFLAGS        +=3D " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl =
"
+LDFLAGS        +=3D " ${STAGING_LIBDIR}/liblua.a -lpthread -lm -ldl "
  CFLAGS +=3D " -I${STAGING_INCDIR}/lua5.1 "

  do_install() {



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


