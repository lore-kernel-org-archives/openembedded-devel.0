Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsBFl-0005k7-2n
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:11:09 +0200
Received: by iwn2 with SMTP id 2so3075109iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=PPWu9VN5DlHmNGGegrID5OquORAY6j67IcTK0Vzanyk=;
	b=MN9c2FmWZ9KsCP1H14FfeP3DDCa4QAbK3tGcQ0/CwYwFKN9TdBKo6cL6mQiQUR9XZk
	L9LSd2XnUFx9Tu+w/4VnjXmDjG8RA1YGR2T8+xk+dIKhj/nhk9+g5tQPV5VW2v41+p5M
	Jn3+niWsM8eYWHkh+V1diDL5haLPRIjceNkg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=j81DYmNIewNkiNsAzVFfiySZVJrdzoRPbk9DYBXO67PeA3ey2obPHYrBkQoLOj59Sw
	NfTECssILy1WcCxRJR2BOWND9ASPzCYgaFCj5DoH+r+fUuy1SJge50eGTjU9db9rlbzU
	y/YkidKLrsviNJ2iGT0sUNOY+txyajS65zPqI=
MIME-Version: 1.0
Received: by 10.231.146.136 with SMTP id h8mr4141132ibv.0.1283677832236; Sun,
	05 Sep 2010 02:10:32 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 5 Sep 2010 02:10:32 -0700 (PDT)
Date: Sun, 5 Sep 2010 11:10:32 +0200
Message-ID: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: pulseaudio issue
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
X-List-Received-Date: Sun, 05 Sep 2010 09:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have an issue with pulseaudio:

|   CC     libpulsecore_0.9.21_la-svolume_arm.lo
| pulsecore/svolume_arm.c: In function 'pa_volume_s16ne_arm':
| pulsecore/svolume_arm.c:53: error: can't find a register in class
'LO_REGS' while reloading 'asm'
| pulsecore/svolume_arm.c:53: error: 'asm' operand has impossible constraints
| make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1

From searching the irc log this is a longer standing issue.
Is there any suggested solution for this.
If I understand corrrectly it affects all our armv4 and armv5 machines.

Frans


