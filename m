Return-Path: <pauldotknopf@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4DF7199D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:15:34 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id y47so95679068oty.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=J9+CmkH6oLCyMxNRRz9VOAjXhnyagVFOcm5AIEvbH6s=;
	b=JO3tp2r4Di/EMHsB7Czt9xEhiM6X2zV/h1DMs5k0tHIXy4p6+QVQ+RuLdjtqsUA5dy
	/Vlixu3F0QfYAuZerW1SgjutF9MMh4LBj52xnzPfVXK6E/EERs4xJRVAbZMtOwNS4Uv2
	nBKeHjQ4p1XJgnY4qU9EiOKLqKBpsvxU4WQ1W84bY382VADezot2HZ2oqTvh9vSf2bOm
	yQdwjk0hnMgI7zEyhB96T/Va7iUxv7qWUUVQRnNSGp2P61g0J/GNt3exXLbZHasG6F5Z
	84hbI5ruWawUVBStcWyEajpR0XkdsBOpTNSI9K5uf4bmL9nSjitRa1ly/D0DFRygggiM
	S44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=J9+CmkH6oLCyMxNRRz9VOAjXhnyagVFOcm5AIEvbH6s=;
	b=Wp49rcUiGQYgNKp5bIjFW++cyDozKbLKB4OLic9gNv/5D+bPJ7+vKUUVYBkEgaqeWG
	i06VJvPYdqwV4QPYomgMjMcqKFS/L+KbJgGvMM5z2ZfM7BdIQVRYit+fEVAVuKi2KdXU
	8CBiqHNaRL9CxCz4Q0/8bMzgRkHraAFLEWhQ49x+gesRG1zTVb8IlwqRYINXofBV2ukK
	lAvQ/yQR5KkaGLOznd3KYLd6utd85vVdjXSOo5s5V3tIWBTCmqqQsisSz2x6rE91oTNy
	GMzqXPOxw8XDKIiLzljOka1+T57H+f+4UhSi3GsilUvP2uDVaLarcN3/cxOtHkSUgSTE
	QlFQ==
X-Gm-Message-State: AKS2vOzJPjJRxWnv1SX23HM7fI+NrM8QYmRuMVXGXE1dM141iJv1CZO3
	feVG/Iy0RdevWPlBOiNOk0jhi7hinXMt
X-Received: by 10.157.32.76 with SMTP id n70mr15440780ota.151.1498068934946;
	Wed, 21 Jun 2017 11:15:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.139.150 with HTTP; Wed, 21 Jun 2017 11:15:34 -0700 (PDT)
From: Paul Knopf <pauldotknopf@gmail.com>
Date: Wed, 21 Jun 2017 14:15:34 -0400
Message-ID: <CAKmWj-1-sXNeNBJpO1uzF+8q7sFjS3XO4m=hQL3CDa10T2H99w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-qt5 nothing provides qtdeclarative-plugins
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
X-List-Received-Date: Wed, 21 Jun 2017 18:15:34 -0000
Content-Type: text/plain; charset="UTF-8"

When I try to use "packagegroup-qt5-qtcreator-debug", I get this error.

nothing provides qtdeclarative-plugins needed by
packagegroup-qt5-qtcreator-debug-1.0-r0.noarch

I am using poky/pyro, with meta-qt5/master
(3ae86cb32edd1449f702e0a094929ae9b21ce191).

I checked the build/workspace directory for this recipe, and indeed, no
files are being put into the qtdeclarative-plugins package. The build
directory contains no plugins directory.

I checked the morty branch and some "plugins/qmltooling/libqmldbg_*".so"
files were being placed inside of the "qtdeclarative-plugins" package.

Does the "packagegroup-qt5-qtcreator-debug" need to remove the
"qtdeclarative-plugins" dependency, or does the qtdeclarative recipe need
to be fixes to include plugins in the build output?

