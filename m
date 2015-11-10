Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1D0766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:22:36 +0000 (UTC)
Received: by wmec201 with SMTP id c201so3132651wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=eFNVUxtfxIGyRTPK34hVQRTSWegFbSFMSxOW3dLAT3o=;
	b=B+SF7nQrZS2wiHOsMj5+kJcznXyD8+pwb7q7nzvjLZORTFqh6/Jwy/07/qiqHq8jeO
	Qz8V7yj129WnNbjOcfpNTmMJwGPuwrkAK/Uj7yd263ZVPWLoxsv0qW3Nakm4thCu75NO
	Lnsajy20Zax7t4b1d0oiQvO0U7PY/Z6YBzeYJvTyulM9MefAAHwHNHRyx5hAo8vbcHFf
	XM885glnR6seqnRwXtiO3jew+nZB9n38mOn6MsikQ1UNx0Qi6DEyXP2VWqiUxzbltmUv
	JBUzg033snNMpRrWziajRUchoRiVPAdn4LWTVXKFdNpOzDE+z9y0DC+B21cdNAiNthCv
	QbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=eFNVUxtfxIGyRTPK34hVQRTSWegFbSFMSxOW3dLAT3o=;
	b=B20NG7Y4deykurxXW3qDO0COHvcmTKNgw6HBTPY8+EOCGSkUVB8H3U07SixQ87w5a5
	B51fGETe6uW89yftwLTYcSOkNZ3tymmW7OGsCuy6qnWnKUdweKKk4ED/hKtHIJG2iBGu
	kk8j+3Jwygf1r/DXn794HZtpgNODLBQCqbuFFo0lRRelpw0uwj+2CrLSg9TZ+f1eFHHT
	MJ6MZZs+HvESxH5dNvwpiTpfzzxc1Z9yn3L3+Pvcj7Fg1Xzi9Mr3XQzPH/CWUbpF/92N
	HGzOzmylBv83+tBZBrr8YuP7LlTZXF/gt3HpvytmDKsHzn91MsL9kEUOKtDDBpluEkIv
	Wv9A==
X-Gm-Message-State: ALoCoQlQ4ciVy8mpWeWaYEPIVMRWggvJTf0elKraxds0MG9DU9iVcy9XImJyrAh9F2cmrGYglYJO
X-Received: by 10.28.174.144 with SMTP id x138mr33825248wme.28.1447165356506; 
	Tue, 10 Nov 2015 06:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Tue, 10 Nov 2015 06:22:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 10 Nov 2015 16:22:07 +0200
Message-ID: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 14:22:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

There's currently no software built with vala in oe-core. That's not great
for vala (as it's not getting the automated testing that high quality
maintenance would require) and it's not great for oe-core (as maintenance
effort is better spent on components that _are_ used).

Based on the above there's a feature request** to remove vala from oe-core.
Please comment here or on the bug if you think this is an inappropriate
idea or have suggestions.

If the plan goes through I intend to send a patch to add vala to another
layer to minimize disruption: I guess that would be
meta-openembedded/meta-oe as vala seems to have one user in this layer and
another one on that layer ... Suggestions welcome on that as well.

Alex, note that this might affect your GI patch set (or the other way
round).


Regards,
  Jussi

**) https://bugzilla.yoctoproject.org/show_bug.cgi?id=8640

