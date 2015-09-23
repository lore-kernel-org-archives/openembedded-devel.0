Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA23756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 19:16:59 +0000 (UTC)
Received: by qgez77 with SMTP id z77so27749663qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=aAw8pNYXYqGnkGGqlyXyj9VZB6/OoUMvxpHv1c2FQmM=;
	b=LS2wUDLFIzBqTagomjBy7FOV+brK2fxvq9oYMC3olgcUer92yE/oHXdWANSoqscYYc
	DBp/EB2HJWej36DF4ujyKUhPreV7STyoGoD2TGRINzDQPt9KE8MZUizmId3KWCD/FxWR
	KeT971kASBpo1IYKkG80U48Nf22RvUVukcJ4rEH38PORu5aqKBtP3Y81qaepR9TRAYf0
	BQlopCTEB79PRBR0pLZxJ0o2UhCiMBS20/f6mhez+6LfzamTT8RqHkR9wey8KyPx1iWT
	WBb7QDK0lLmye8Wu6dS3vp4rQSxVAwROcfHZUwQqu6pAmheYOBIRc92wlBohXa5U5448
	vuzg==
X-Received: by 10.140.98.54 with SMTP id n51mr38173648qge.75.1443035819767;
	Wed, 23 Sep 2015 12:16:59 -0700 (PDT)
Received: from localhost ([177.100.173.218]) by smtp.gmail.com with ESMTPSA id
	h108sm2019587qge.21.2015.09.23.12.16.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 12:16:58 -0700 (PDT)
Message-ID: <5602faaa.755f8c0a.382a5.ffffb1a7@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Wed, 23 Sep 2015 16:16:52 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Wed, 23 Sep 2015 16:16:52 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2015-09-23
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
X-List-Received-Date: Wed, 23 Sep 2015 19:17:01 -0000

Hello,

I pushed following updates:

commit 6ae140b29f0201fe3bb470da8c96c9e142294ebf (HEAD -> master, origin/master, origin/HEAD)
Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date:   Tue Sep 15 14:50:02 2015 +0200

    chromium: Rework the evaluation of the Wayland feature.
    
    * Remove the ENABLE_X11 variable and rename ENABLE_WAYLAND to
        CHROMIUM_ENABLE_WAYLAND. Make the old ENABLE_X11 be just
        "not CHROMIUM_ENABLE_WAYLAND".
    
      * Allow configuring this in the local.conf file.
    
      * Add a couple of sanity checks and two notes that will
        let the user be sure if the ozone-wayland patches will
        be applied or not. This will be checked before running
        the do_fetch step of Chromium. That way we avoid printing
        any warning or doing any check when parsing the recipe.
        So we only warn or abort when Chromium is actually going
        to be built.
    
    Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 65d7e9feecda9b5d67b293bb3e4c08a5a741a148
Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date:   Tue Sep 15 14:50:01 2015 +0200

    chromium: Clean the definitions of some ozone-wayland variables.
    
    Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 556b41acba54a7d75f09bd920bdd5c86a238dd13
Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date:   Tue Sep 15 14:50:00 2015 +0200

    chromium: Allow to build in Debug mode.
    
    * Add also a patch that workarounds a build error when building
        in Debug mode and using GCC. This patch has no effect when
        building in Release mode because is guarded within ifdef(debug)
        blocks.
    
    Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

