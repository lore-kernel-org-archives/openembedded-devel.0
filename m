Return-Path: <cmayer1@binghamton.edu>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E24E066123
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2013 16:23:34 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so7228004obc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2013 09:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=dP/8HJUMzN692rVZjh3rI1h0ZzI9C4Qy0k8XawZN3PU=;
	b=N296iDmkXI3ez4P1B0OawjXV10ZwX6JIvq2nlzHBueV0uJZZVmfQPRgGDCZaQMzYpO
	fFhkDGlaH38lMezxYNIoc2U//Ssh29xdXhpHT5N8Wr0ycV3teYLnih4orS/kNxnnOhHk
	ZFf+wKiUEpkFpZBP8FM0Oi9eI04c2MnZZs3MssD6UiVQLZ1/fEQwXkr5scz0DBcxgXaj
	8KR6Qh7UYBrl4cPNKEjjYhWngK2/ugBcotO/cHZ7UQ7vP7BCwVaFRLpbSL/gWPDMsOWt
	rAFB3WK8Ekr80YpPqaf3qUZdiOjSaoewRPOgmJSfLnUeBqcWWewWKYygxSwS5rdtf8cj
	rgOw==
MIME-Version: 1.0
X-Received: by 10.60.55.65 with SMTP id q1mr24524505oep.92.1373387015494; Tue,
	09 Jul 2013 09:23:35 -0700 (PDT)
Received: by 10.76.19.18 with HTTP; Tue, 9 Jul 2013 09:23:35 -0700 (PDT)
Date: Tue, 9 Jul 2013 12:23:35 -0400
Message-ID: <CAOys6npcxfg0e_udHbXtt-V57eJaXRtgU+j3WA0Gp+xOHGS5mQ@mail.gmail.com>
From: Christopher W Mayer <cmayer1@binghamton.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnuTm39FLhEgZR4FhIGUHj9FERHQKDcFnzefHiyKaFk3VA7dBcgpiQUZQT6elsMHoTbGdhO
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Using Xen from Meta-Virtualization
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
X-List-Received-Date: Tue, 09 Jul 2013 16:23:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Everyone,
    I am trying to use the Meta-Virtualization layer to build Xen dom0
support into an Open Embedded build. I've built the xen-image-minimal
target but when I try to boot it as dom0, I get this error


*'elf_xen_note_check: ERROR: Will only load images built for the
generic loader or Linux images')*

I used this link<http://xen.1045712.n5.nabble.com/Panic-on-CPU0-Unable-to-boot-with-Xen-4-1-on-Fedora-16-manual-grub2-config-after-compiling-Xen-from-e-td5571653.html>,followed
Ian Campbell's instructions (the third post down) and found that
the kernel being built is not Xen capable. Am I missing something simple
here? Is this a problem with the layer or am I using it wrong? Any help is
appreciated.

