Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec@linaro.org>) id 1UQDbV-0005Fu-2k
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 11:15:39 +0200
Received: by mail-wg0-f43.google.com with SMTP id f12so1335222wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 01:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TLjkTbbE5ce92PoPO5UZb6w7Y7KMF5zj5G6PNFd4NDo=;
	b=Ms7AnDP1po4tfZ1AWInFK7/zecSUhy1Wib5+VHELVv3NpS2cpHZmE1raIdhWfls3pn
	guSEReHeLkttNiFAgChypEyE8SAHDjQ2uu9yA2vlAIJWKWCsEnqpJ1EiDzgXbLRMVvUl
	r8Keznai1iG8q5meRWeFVJmyXtiiZHF/F8fim0afPXJISSHQHzUnWtt4t0rWCH7S5YPr
	K2H7QNJSLuxr8LJFzOaA6AvU3E1hXPLYlljiDILm+Re9ej3Bv00H1OKrYYpP+/9C9wfD
	9yAzGPvLZ9S4tKjsN8V28L8+6VZoNAe4g8G5bRT7zYS+6arfDc0abkD6afTn4FVzRsuS
	UiPw==
X-Received: by 10.180.10.105 with SMTP id h9mr8705434wib.34.1365670694270;
	Thu, 11 Apr 2013 01:58:14 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPS id ed6sm1970084wib.9.2013.04.11.01.58.12
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 01:58:13 -0700 (PDT)
From: Nicolas Dechesne <ndec@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 10:57:04 +0200
Message-Id: <1365670626-18585-1-git-send-email-ndec@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQn7gbZTa3k0eufDtI7fXu6SZMKFqWwKHRcS8D4rz6vWuOBiPwW5VAsAwBIxD3YzcdOSo8/5
Cc: Nicolas Dechesne <ndec@linaro.org>
Subject: [meta-multimedia][PATCH v2 0/2] gupnp: removal of gnome-icon-theme
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
X-List-Received-Date: Thu, 11 Apr 2013 09:15:41 -0000
X-List-Received-Date: Thu, 11 Apr 2013 09:15:41 -0000

So, as discussed, i have added the PR and INC_PR mechanism. I decided to follow
Martin advice, not to add un-needed new PR bumps in other recipes from the same
folder.

Nicolas Dechesne (2):
  gupnp: add support for PR, and INC_PR
  gupnp: remove dependency on gnome-icon-theme

 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc       | 4 +++-
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb | 2 ++
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
1.8.1.2



