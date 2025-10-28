Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A826CCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:54:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.10881.1761656084221819937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 05:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eR0bEuAs;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: marc.ferland@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so5506487f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656082; x=1762260882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rofVlU+0Hdw/IldoSai87jE6sW4qdH7xz/qOxGIM0w=;
        b=eR0bEuAsngJEhet7Ke8wUVt7fAxTsKMjwYdRVLVTRh7h3mb6fezFaZqqCl6idy0i9z
         YKR1UuqTw8uv9gDcNijrw7aZe5qetVj+wzXbi8kApfUxutQf9qc8ba9kGWjvmwuRUkGK
         nyDKivpkLB7seXcbm7XgVAJBbebrc6Yh8/5xth+DlgE9H3ZKlC1LFP0nSfVcZINk+ppH
         GfKtY/f8ajro7+K2Ek2gIr0LEi40lZHwN0/zNnANrPADjQ4Zmei4sUJZ5CWEOnZI9Qnm
         g53RpoP4sJB8VyAiUmiHx9I0PYqMD5lxQbohcYCO3O3CjT5LLmVl1uRKuzxCzXOanhx0
         JfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656082; x=1762260882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rofVlU+0Hdw/IldoSai87jE6sW4qdH7xz/qOxGIM0w=;
        b=BgZ6dsT1kHzW0Cy9XCvdBeHvLxmInXzmdbNlNoIgwbk5FxWJsaLA/4T848epwXD6ef
         hWvttj0/lHRBo5nk1LIIolhXTF04JUFOr9lI3AwElIbq1bzH9JUxOuuQC7lHTB2qhMpt
         LGE6t+H4N58VloLsOeyiYIK5ftEj50V5VTew86Bfg/FGa48H9vkgtW7t7Qr4O+hUPXN3
         ImhbcsgiMVyof9umSI2bncldb9uIN0nT9CUaVWpMgNiqAChQXkO09vbAW6nps2v2+uiI
         MdDCBS9U2S6XcpDPYNsyiwAz7tfizJYOHOTvpM8WJTZ8OYnERvJ5U1XWXLEZ519dl+HD
         DOTQ==
X-Gm-Message-State: AOJu0YzBlbN8bSeK4rf7GKWJ81QPErY8iEF4sFRYGmV8APyfeHwm3cme
	nIJpGWa9FFau4g7KZe1MCkP/9WRseZCudFvcG5FwoJdzhRorwhxm+o+Ze+gPMg==
X-Gm-Gg: ASbGncvMXNWUJZriJ/y75qb8MFCfWNrJNd2HWTRgRzx0Ti9nL/EYJV8HfkEl+0Ce3db
	tGq8f8/SdDszAxcTqcGpTSw2zsjKQ0vfDFFA8YvMMyQoG9+R2KRCDRa7d3Q4jFowNDvIsN5MmHz
	JbMfFBz3+fa58LtJruTuQe8loLZ3emW/ljVSUzXlIcMbMTDfkdVdTsa9yNCbbTGOdoWZT8wn6qI
	j17NPxGX3avyRNiCBAYmVcJnkYObMGdBHp/lBZmj05jHYTrY2lTLc83Rm+TviMYZqkCMnEWvpXJ
	NORFzjoxX9anHHb1qPIArUC3nd+iec2BHEf0WUvwXey365dt72V+Z3GNt2f6GYI8tYnlDTmuf63
	kbCgKg3lokG702Qh+Yztk5aeDzPSUfvei0l6YhjmewEsXLrwOdR+9Q+soOWSbculcWTNEQixBD6
	HufluZHHBHcYEryOIA3Oz8gmY6SkIVVWe4PZLKcjBPFOUXXC0GzG/2zxFHD77yB1X77X5Wv9LKx
	X4zdmwJf3cBB70EwjQ4ceMLf3E=
X-Google-Smtp-Source: AGHT+IFQ6kDQ1fTGUQ1Bavr9dpLfxVGUw0uZCmTYLLgmqabAWZ8fx2me3uBOc6ExUh9GWlxs0lnTkw==
X-Received: by 2002:a05:6000:25c1:b0:424:211a:4141 with SMTP id ffacd0b85a97d-429a7e6354dmr3233487f8f.27.1761656081958;
        Tue, 28 Oct 2025 05:54:41 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952db839sm21015305f8f.34.2025.10.28.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:54:41 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCHv2 1/3] freerdp3: upgrade 3.17.1 -> 3.17.2
Date: Tue, 28 Oct 2025 08:54:34 -0400
Message-Id: <20251028125436.2426288-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 12:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121088

From: Marc Ferland <marc.ferland@sonatest.com>

Changes:

Armin Novak (20):
      [winpr,pool] limit threadpool to 16 threads by default
      [codec] use default threadpool
      [winpr,path] fix missing length check
      [proxy,channels] better NULL checks
      [codec,yuv] wrap step calculation
      [winpr,sspi] log mechanisms not valid
      [client,sdl] improve clipboard logging
      [proxy,modules] generate pkg-config files for modules
      [proxy,modules] fix entry point for dyn-channel-dump
      [CMake,winpr] add pkg-config dependencies
      [cmake] static build: populate private
      [core,gateway] automatically accept ARM redirection
      [scripts,android] update openh264 to v2.6.0
      [scripts,android] update to cJSON v1.7.19
      [scripts,android] update ffmpeg to v7.1.2
      [scripts,android] update openssl to v3.5.3
      [android] build without deprecated symbols
      [client,android] update gradle to 8.13
      changelog
      release-3.17.2

David Fort (2):
      settings: remove duplicate setting of GatewayAvdScope
      rdpecam: add some new callbacks to the HAL

Pavlo Myroniuk (1):
      fix(winpr): pin cert labels;

Simon Nivault (1):
      Fix quote parsing

akallabeth (28):
      dev cycle 3.17.2-dev0
      [cmake] fix library naming
      [winpr,file] fix TestFileFindFirstFile
      [ci,mac] cmake installed by local/pinned
      [channels,drive] tolerate drive_file_set_disposition_information
      [winpr,platform] add macro to disable deprecations
      [winpr,path] fix big endian issues with path
      [CMake,libfreerdp] add pkg-config dependencies
      [CMake,client] add pkg-config dependencies
      [proxy,modules] extend dynamic module loader
      [winpr,threadpool] default minimum thread count
      [core,peer] only set TCP_NODELAY on SOCK_STREAM sockets
      [core,tcp] unify setting of TCP_NODELAY
      [server,proxy] eliminate unused variable
      [server,proxy] check file exists before library load
      [codec,planar] fix encoder regression
      [winpr,thread] add unit test case
      [codec,planar] unit test compare encoded data
      [client,sdl] explicitly handle KMOD_NONE
      [client,sdl] update manpage
      [client,sdl] add SDL3 names to SDL_KeyModMask
      [core,aad] set FREERDP_ERROR_CONNECT_ACCESS_DENIED
      [core,settings] do not check for NULL
      [clients] add checks from #11804 to all clients
      [client,x11] fix rails/desktop switch
      [client,x11] stringify x11 error handler call
      [client,x11] fix rails to desktop mode switch
      [client,x11] disable output during rail/desktop switch

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../freerdp/{freerdp3_3.17.1.bb => freerdp3_3.17.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.17.1.bb => freerdp3_3.17.2.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index a46eb4d32c..ace07798e0 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "854937b55bbb81a92114cc1e6f5ddcaa8d22a669"
+SRCREV = "955ad49545919c35ed731bc7716b26ddf888833a"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
-- 
2.34.1


