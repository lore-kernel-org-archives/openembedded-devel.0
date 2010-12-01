Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PNuGk-0003d2-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 22:31:18 +0100
Received: by wyb40 with SMTP id 40so7546386wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 13:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=hgrI0XVdv2IPg9lqJRRhr88yvwOROt8VWwXtuBJRrZo=;
	b=FzaUMZG9IEEAKP8Yb/VsSWdTeY8Cag280wk9GENIq4qfFmJSJcCzLBYD9OgxS/yKD4
	Ag/PzIUzxRBpbVM/MuYWvPfT2P+qSHsVNssFq+o0aBV/poFWtgc0MJxfy/Jn2Jkmmkl5
	1auyy2ARh1uMPGV6Px8TRhT/nAv1kxLFKzAAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Wz3ymxRcezTIXGIbReSTPDftWEt4jFy7NoY4HMeKe/HwJnDhggR4HWa9HNH/RXnzxH
	giJ4acY955SRaVnu48Xn5Pw6Gj3pbHEq3xIDdjQPfWBNJn9mhPjH6LFm74rl/w3sVPMV
	1qxnihQZQR2KlpB9oymmZII4d2XSaoJo5a6lk=
Received: by 10.216.239.199 with SMTP id c49mr1691662wer.12.1291238992925;
	Wed, 01 Dec 2010 13:29:52 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 1 Dec 2010 13:29:32 -0800 (PST)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329CC199B@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
	<i9aai3$tmj$1@dough.gmane.org>
	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
	<1289399216.1272.415.camel@rex> <4CDAC864.7050803@mentor.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329CC199B@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Dec 2010 14:29:32 -0700
X-Google-Sender-Auth: 0ed3fkA6K0Bw0pgXHsXgIv0WZtk
Message-ID: <AANLkTi=ZGEcae5H38WApRqkR=xNXByrkmv67R9YBX8e7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 01 Dec 2010 21:31:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 1, 2010 at 1:26 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> I know this was all posted a while back. =C2=A0Has there been any resolut=
ion on this? =C2=A0I didn't notice any additional responses to this thread.
>

See the TSC meeting notes, it was discussed (with myself excluded from
the decision making), and the decision was that it would be reverted
and the issue revisited with an eye toward compatibility issues on a
branch.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


