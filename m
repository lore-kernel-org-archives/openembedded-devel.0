Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P762O-0002LW-V8
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:39:02 +0200
Received: by iwn2 with SMTP id 2so1980027iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OQhRT/lX07xusmRYC2O0mhCAs3sCWPU6PhnTvksKZMI=;
	b=LLr9/phvFIVBvqtENJskPNtzDFa3oZIG+EbUIMzSTz8lzDM10CjagKUT3gHAj41LWi
	I4UwakbJWvzKheV59Azw5YpbYPt/C30Ces6UC7wDtInl+yQ0vU/MU/yGdeaZTK1DgvjM
	9NfQv1ntZb73+ZGo1MQAwErCHepyEKoTZU7Mo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TZZI6zR1treY4CA3ezrS5AWLq3J1M3RS28VeIaDs7R7H1VSY4uMTo1G5L68VfRQoA3
	Bo9CRDq8yTC1jjVlh/1JLiLoOgbuezUbaiYJih3WfVwby6nUF8X3diFdQkgYQ6kvOzvJ
	sEhnzc68Sin5pbCEc5tOw9p/Cwu4hP1OB8Qmc=
MIME-Version: 1.0
Received: by 10.231.35.131 with SMTP id p3mr1619752ibd.177.1287232700584; Sat,
	16 Oct 2010 05:38:20 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 05:38:20 -0700 (PDT)
In-Reply-To: <4CB99A9C.2060507@freyther.de>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4CB99A9C.2060507@freyther.de>
Date: Sat, 16 Oct 2010 14:38:20 +0200
Message-ID: <AANLkTimxoid3rc0WYxeBHQ-exksUYpuGH3Y9PLGfEnk+@mail.gmail.com>
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
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:39:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/16 Holger Freyther <holger+oe@freyther.de>:
> On 10/16/2010 01:56 PM, Frans Meulenbroeks wrote:
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> =A0recipes/gnutls/gnutls-2.10.1/libtool-update.patch |10965 ------------=
---------
>> =A0recipes/gnutls/gnutls_2.10.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 15 +-
>> =A02 files changed, 13 insertions(+), 10967 deletions(-)
>> =A0delete mode 100644 recipes/gnutls/gnutls-2.10.1/libtool-update.patch
>
> No,
>
> I think that appraoch is wrong. autoreconf --install --force should call
> libtoolize which will copy over new files. So we should delete the libtoo=
l m4
> files, run libtoolize and hope that it works. Did you try this?
>

I didn't try this, I am an autconf n00b; basically I came to the
solution above after discussing this on irc and peeking at the patch
from Henning
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Deb059202723=
cefaebe1242e4d1ec2a00c35d3d94

Frans


