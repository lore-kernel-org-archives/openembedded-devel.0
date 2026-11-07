Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11967.1794070360391745675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tw+/+dzv;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12078195e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070358; x=1794675158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/beBo9iLcMzJtWMB4MAUrWZTcy398bmswiGamcAIfs=;
        b=tw+/+dzvNxoZ0bdRehvYA3RAhNQgEiK6zseHleVf8yp7uXkXBb8pw4bP6YWqEV4HWb
         +nci2hjcGgjF+Qtlqq8tDHU6Q4wUmu4ZFf1yWx+Q7HCDtljfTsPtl+YhnZ5Ce13H94gg
         JbzRPfrlIOsl5k7vBQUEs5PmNExPTbTBKeI8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070358; x=1794675158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/beBo9iLcMzJtWMB4MAUrWZTcy398bmswiGamcAIfs=;
        b=c+ftJTogfqvwKyDEl3YRzisjDr+aLytTvpjD8zZiYAKY3gY8LRmqKgsDxDZjdtuHSW
         XG0UsOIEeq/w1bpWwp6QooV2jCHk+jhQ7v0iO+zlaqq5ZyAiV2G41hhaqZ2jWhv712G4
         LV+g9rceIznKroj3v0vAF4oShYMlEoR22HdbUSFTmAxNrvkDucOab32FQ92kU4eRdyVG
         fIwEPl4KkoyBGk6deUz1SSErirus6TAup/ELNMxj03y/oZ3pjQxe4H4vpQKpAUefqjZX
         JrGkkfeSG91b0bb0qXA8WJgVTBTebSVcmeMDPQNgm97WQsIutGSu0BIgMH/I+FshJGJP
         cVbg==
X-Gm-Message-State: APuU4Z+zDmfNof0mo3j7oHNmQD8CjHyXGbGS4hWj8PBb1kAcAxthJI6X
	7ol5tv3N6uC4u3Z1L9VnaQawMaMt78CZe/UGJzTv9k8B9a0FsGXan0+dm7tfrsJYUh6Ct15pcVR
	uZ1q0
X-Gm-Gg: AYBFou3TMuo7AQnBH2d0qJjCWsbRrajDWs79FXR7slO4XTCnesytcfqLsUR6JwTNuiJ
	SA7eZ5DHjYPkjrSyf44tKKya79bvqB+6woMzyBIEHFNQYInprfyYoRh5GKA2xmPygsJiqgUr/O4
	gUtzhfugQ/nkWyi7j/f28sxv9AsLW+DJXq4QQOXirBXm3umXdqXro1r/DI7WvnL+LPGon2p1nki
	8ZeXFjlX/P8yzi3/z1Otryy624uI9l606w7FvRS8A08z20hLTstEgApON8NduEP5AtwATWDBV6A
	z7n91jtLc3s+cHHxQ4w4bpCrb6KdSSE3/2KLP4d0uWC7antfogebdSu3JJ7pSMbHwaG1XZmC+DU
	V639kwk4SkaUqxRW1v+n8sqfrRfU3cHvvLBikLGMp+amido4rYBfbQdRLR8xgscWkr/qjwn6l0s
	myO8lHFLyvKCTVzl/7j4PmyjmS8QkmF92o4MZclxZQLjtYcB2pE3XSg4Z8ifB+/gZdjs/RR6w42
	pkJA/CkNb/AaPFk7JkT0ILq0+DK61dP1kNP777GJiT2C0JjSACIsaVuwrUhRHcySEyNplfytUyG
	HAhzGZsCznsxzLR3Nh73M+meJnOmwa8iFl1sDlrfMncX0V7nodpPgHczqKeluHwwwUUk4EWzZH6
	VbF+ssrNq2ZKZVW287dN0NavHiu3qZ8LBzdhCCo3w6IAwtxkE/j/c4w==
X-Received: by 2002:a05:600c:a47:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4b6df21324cmr109136335e9.13.1794070358609;
        Sat, 07 Nov 2026 08:52:38 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 15/22] libnice: Upgrade 0.1.23 -> 0.1.24
Date: Sat,  7 Nov 2026 18:52:14 +0200
Message-ID: <20261107165221.122340-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132000
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.1.24:

- API: nice_agent_attach_recv_ex() to retrieve extra message data
  in recv callback
- API: nice_message_extra_data_get_tos() to enable access to
  IP_TOS/IPV6_TCLASS IP header field of incoming packets; requires
  GLib 2.88
- API: stun_usage_bind_run_compat() to allow specifying
  compatibility mode when sending a binding request
- Nicesrc: Attach GstNetControlMessageMeta containing the TOS
  header field to buffers
- Ensure NICE_CANDIDATE_MAX_TURN_SERVERS is obeyed
- Ensure nice_agent_get_local_credentials() returns FALSE on error
- Fix random crashes
- Fix potential heap buffer overflow in UDP-TURN over TCP
- Fix compilation on FreeBSD

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libnice/{libnice_0.1.23.bb => libnice_0.1.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnice/{libnice_0.1.23.bb => libnice_0.1.24.bb} (94%)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb b/meta-oe/recipes-support/libnice/libnice_0.1.24.bb
similarity index 94%
rename from meta-oe/recipes-support/libnice/libnice_0.1.23.bb
rename to meta-oe/recipes-support/libnice/libnice_0.1.24.bb
index d670f49b5e..64c72b87e4 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.24.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963cc62096d5412ee9580043babb8b60 \
                     "
 
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "618fc4e8de393b719b1641c1d8eec01826d4d39d15ade92679d221c7f5e4e70d"
+SRC_URI[sha256sum] = "cfb5e8e778534f2f5b3c6f4958a1eb057c6b95c537c0f100817a537cf5d64fcc"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/libnice/libnice/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3

