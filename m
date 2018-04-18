Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB0974525
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 11:50:12 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id f14-v6so4006956wre.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=zd39wML+c+OlBapZ1enM+ZWlY2Fh2+s3caVsZgHzyiI=;
	b=d5OuUluHSFDrv85/Ch+k0DOZTCI3SMjLMb830I8/fXiDoEOv34tV6m9wlSdau4BS/B
	JEdmVZj53vP6RcYQk2Z/e01XiXNEIO4QcNUqt3ww6Q7WhYuJoKKj8Yuaw7eOGG23IlVb
	P9WPD3wr3v8Qs7z0A0aVL+h9rued02o1YLAB4hdcnnjX1TJYS6YhplbiFNxaaKO72ubn
	N8c4KJiTg9oXkeQPISfLAiPDw3s1qcBSXZKVHA9hw4h35opUIrXNBZZA0P3w/kPRGSnx
	sOJHYSur3ZuxfxfNCKAvPFPtJGuHRjgirUbEmOmHLiApwGYmYZNjOjpi4vS8MjuJ9Vn3
	u0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=zd39wML+c+OlBapZ1enM+ZWlY2Fh2+s3caVsZgHzyiI=;
	b=HXeaEHi2S7jeMFCtWktM2qdnDCaSYsg3a2zsA/GdLdlpskxj7ertA5g8kPkedE42tM
	K3l1eELJK5654W80q12RBntZy+W5muCduw6hQpV1N03DBKlhwLLmQm/dseEPa1WQ1vhR
	ni69zUW6R3Ln/akIDNq6EhgdgtUXdrSGbGhh+NDXg+XX9j+3rW6e+2CkPcyS+Vv7jG4n
	+gfQleWxPkpS47c+n3DSvBFj5KwGEVjg+LBE97saCAB5jW0BiDasORzcqB1vbXaig+Ce
	fCLSyeR/rV8tVtur+6p8zxNkrqgPkl4n7EzvPPLRp17IcCbID/87QfWmnLUTI5SYJiq8
	HX3A==
X-Gm-Message-State: ALQs6tAyBXX6d4O1u4IPHaYCJ1x9/+l9pXm6dQCNai8w1uhzyO3ATJA6
	/5ZeDc6YjvDqbN50whDR3IkCebP6dirRisSXbVsjcA==
X-Google-Smtp-Source: AIpwx4+g8TNIsnvJtfkNeGiPyHHi+Q5sqPnjKUm7I/0vtO4offHsJBtKQNZFrTS8ee1UdrQDikhTGhJoOdmP/4K02nQ=
X-Received: by 2002:adf:8bc7:: with SMTP id
	w7-v6mr1506620wra.230.1524052212892; 
	Wed, 18 Apr 2018 04:50:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Wed, 18 Apr 2018 04:50:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Apr 2018 13:50:12 +0200
Message-ID: <CA+chaQcOqEibGRtm+eSNmJJXcj+f88s89PHXTV9az9b35VW2Mw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Most meta-qt5 patches on ML marked as Not Applicable on patchwork
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
X-List-Received-Date: Wed, 18 Apr 2018 11:50:12 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

who/What is marking them as such?

Makes quite difficult to find out what's there for me to take into
meta-qt5/master-next

https://patchwork.openembedded.org/project/oe/patches/?submitter=&state=*&q=qt5&archive=both&delegate=

I've used the mark the patches for other layers (other then meta-oe layers
except meta-networking) only as archived while adding them to corresponding
bundle as described here:

https://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork

Was this work flow changed? If yes, then how and is it described somewhere?

Otavio: I think it's time we start using separate ML and gerrit for
meta-qt5, do you still have the public gerrit instance somewhere we can
use? I don't want to deal with patchwork anymore.

Regards,

