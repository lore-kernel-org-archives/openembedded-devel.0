Return-Path: <tobisch@dresearch-fe.de>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 68D2E60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Oct 2015 15:36:48 +0000 (UTC)
Received: by oibi136 with SMTP id i136so11355512oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 08:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oONOXUttlXsGdEhcVJNALUs/A4dImClKbaqYSjlkIio=;
	b=QMQjzzyGtzWlAyQG69GwfXV8vpX89wwx4z9i1q4d3vU3yh/fotX1VtjGxlclTAxh6X
	9ZeS3ybG1zcbCjMto2L4vhgoHl9QubDQkou5eexlyzQezttKEJs+1yX4keN0rLGBuU6A
	lNxYUYPHGYT7H2oVhOmHBsn3YzB0ZMHe4ia9Ucaa2pjZXphQ2k+uT/atdpykCG2HDjgN
	CGaElUaNMxrBcWsdL+aGxf1MsijuizadKO5HtowXRy0G4P2zzxztuAM23pkSJE0EXeFl
	ppu+ZwZDgYRy8gfJ7Xnr5tCueQCSmwI9EEptlviz+U+g+e84rw5+CIpHzrDJpOynhV7U
	3SsQ==
X-Gm-Message-State: ALoCoQkNp3HqH8gxVm4M1Xgbhldm1aPekHUPzmdfOw4zYnynEfH5wdGM0oWrS9qIwkoxULlxekW1
MIME-Version: 1.0
X-Received: by 10.202.196.143 with SMTP id u137mr1077948oif.80.1444232209158; 
	Wed, 07 Oct 2015 08:36:49 -0700 (PDT)
Received: by 10.202.196.143 with HTTP; Wed, 7 Oct 2015 08:36:49 -0700 (PDT)
Date: Wed, 7 Oct 2015 17:36:49 +0200
Message-ID: <CAC+jU25s54MZ_bqJk+ifq_OVB4jUr=RPPR=AtUExtq=kmobfPA@mail.gmail.com>
From: Angelika Tobisch <tobisch@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Subject: Multiple bbappends and their order
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
X-List-Received-Date: Wed, 07 Oct 2015 15:36:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

suppose I have layers A, B, and C. Layer A provides a recipe. I want
to append this recipe in both layers B and C.

In what order are the appends going to be applied? Is it
deterministic? Does it depend on layer priority? Something else
entirely?

Thank you in advance
Angelika

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-231 mailto:tobisch@dresearch-fe.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

