Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3B188605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 18:58:30 +0000 (UTC)
Received: by qcpm10 with SMTP id m10so14237245qcp.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:user-agent:mime-version
	:content-type; bh=ux5LCG8YJATN7ljjOXb/eXhWbTWLQ/jDgdi8NimrLlo=;
	b=BVc0TriaVpBMB88uLsIMTPhrMBrYiXrrp7JabgTkROQkbDQCOgaAIU4xPvypivJPDq
	wtpucHaCAZL+Hqt9DImC0JxBNivhijZc8Ltl0VFPD9em60AGXRpI9E8yobVXKsKUZ61w
	eUzU+wzag7rRamyRTbe30o/dCjGEA/WDnixAUelGDp2i1efny9QKPDFlKUZN7mHBtq07
	UaPFMM5JxScktk+f8T1lHG9+XrFsQe+/7geNQkDQY6LNqJfARHWSnT+e6ae8r00ZEI7g
	/P3/ao9mtTOyMjg1ydAd119xkljyTDl05hQuJ8JpyI64sb8h/3yYywBuQJwEvrcu527Y
	cMcw==
X-Received: by 10.140.43.100 with SMTP id d91mr4911209qga.77.1429815512083;
	Thu, 23 Apr 2015 11:58:32 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id 200sm69186qhr.13.2015.04.23.11.58.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 11:58:31 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2015 18:58:29 +0000
Message-ID: <87pp6u4qp6.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Subject: Building openjdk without X11 dependencies
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
X-List-Received-Date: Thu, 23 Apr 2015 18:58:33 -0000
Content-Type: text/plain

Hi,

I'm under the impression building openjdk without X11 is not feasible.
As far as I understand, the headless package is (or should be) generated
by building openjdk with the X11 dependencies, then selecting the
components which are not linked against X11 libraries and putthing them
into a separate package.  Does that sound correct?

Is it possible to build openjdk without X11 dependencies?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

