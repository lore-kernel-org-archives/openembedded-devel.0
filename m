Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9E85974793
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 10:50:39 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l14-v6so10059432iob.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=p4s2K7I1+x/3M2UIlQgGLVjbsmjIapZfRL0ldhfKgsA=;
	b=ZSBFv9jEtry5LY8FA5QTc5xH28l03ptLpRucu4crhfn3KebqxTU8HPeUx0kM0E1CCj
	/MrDIwlH2gralREX4vN1/+Z9/jSbZOGrFjY4qDeqEdveJ4o5vkkP8nYaVSTU/5HR0pr8
	jZEalGxe9W6bX+wNZV3BTNs9mI4ngibSY9wQwOHWQO0GgSOHV3k3dGRmnYD7auAi6tgE
	SrnPeoBWyn3RcdorqMrFNQJy867dRclJeAieEQClAWugddptqOgSDwxEZ1H7saULsi1D
	aTBF38PxFJgWqbjHewauvyXFZJf5SLt6jo4REQD9hEEPG52rgrjPnop1WYdsXTpnG4iS
	4Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=p4s2K7I1+x/3M2UIlQgGLVjbsmjIapZfRL0ldhfKgsA=;
	b=tity2t5Jvt2HP7pHzdPNpG3nvvWuN6sXlGHzLs5L/xxxAi8WQa5lNDn0ft/UiDXI7R
	4b9PMGnMTfaMYYmcfgCb04hv/mV/f1Ma4rxXUncbPVMn23Bk8XKD6CBbXyYJ+qEJndo8
	rT0kA8yJYNBNvZiAeq0DinPatt1o5jTb+qABpOLURB0r170UrILzOgrWfyYRW8P9U5H3
	QgBJx1PCH5nCVuWg0PR+RuGimeyt7sKwuyjFq2A/4AKuKv3O81Zx8vLGkJzocPP5KmG+
	jjgYj2/YoTOlFlpvpo2zJtEiO+aBNBxvW4xHeltW/EL9jmB4fc4LnsAIVBYzAQcHPzgm
	7GjA==
X-Gm-Message-State: APzg51BJfc6JbZ8uXSo4usBLCTms1DEsxsWCPQc2GheRxL9He2TNYZ8u
	QMNY4dYsagwgtv0D949a7PBjyctu0CfThDuXRZZg8rHMXLk=
X-Google-Smtp-Source: ANB0VdYcd9NIAwlfPEBKy/M/cf7XSDHkcYV21ElHyZnsGKgoNHy/7bjpFZg8fETdgVpXNGBZsF9+0Di9nyXrhWBw2zg=
X-Received: by 2002:a6b:5c19:: with SMTP id
	z25-v6mr11284839ioh.265.1535712640376; 
	Fri, 31 Aug 2018 03:50:40 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 31 Aug 2018 12:50:28 +0200
Message-ID: <CAB2nKc_eAekQGQUFcnNp-7VQf=9Yn2R9NDhiLYRfAMPfySsZiQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] gflags 2.2.0 cmake problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2018 10:50:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm having an issue with a project that depends on gflags.

The following commit
https://github.com/gflags/gflags/commit/9e937e80fb1760b0fa893a6e0ec401f9a5bc7946
introduces different library names for gflags, ie, shared library name is
libgflags_shared.so, but,It seems gflags recipe installs libgflags.so
instead.

When I use *find_package*(*gflags* REQUIRED) in my Cmake project, it
appends -lgflags_shared instead of -lgflags.

Any idea how to fix it properly?

For now I added
target_link_libraries(${TARGET_NAME} "gflags") instead of
target_link_libraries(${TARGET_NAME} ${gflags_LIBRARIES})

Regards,
Vincent

