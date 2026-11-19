Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11186.1795082052158658607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 01:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cwZBUvss;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: andre.draszik@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so316421666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795082050; x=1795686850; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp+w3D0ENV0hV9zvGTGcg+NtazsRM/z7KRl9wC5cdXQ=;
        b=cwZBUvssdHNzZkDuwxHYF8ikCSYbRdD/JRlHUs+ZY/xY62z4pWYZsAQhmmlb+3NHPR
         0xRwomCaUzG4ohSn/MP0/aiYVCWENPLcRI1CEMgUYqJBpSnHbO6O6bwYtwYSDH62Fl9F
         mxi5PNn6kgs5s8G4yrHD5OOdpogj3KEQ0xV6Kb0kqo5vk0fbofrDalaDSTMWC+v9CM8Z
         z8aK6SXGbUdCQc/N/2QygnEWJ4iCLso5Ca0XbvOlf9VCTF+4YWllqSS8yAw1mGofs2aR
         DeRpz8JQ74EBHyM7YHE2mR0lqDFvKzijvTgP73ASBtr3TseKPC2O9+BO/MbJCDqsTYl4
         otbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082050; x=1795686850;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp+w3D0ENV0hV9zvGTGcg+NtazsRM/z7KRl9wC5cdXQ=;
        b=cfLsbA5+p22mWKCnPg/mYv86D3zRHF/0/OOFFmZUPrQzCTJvFYJpZ4hNK5Sjpbr/rh
         K9dG4cvuMq1jvAa4FgYth1lH41uv0dd7FDNlJ0X6fMQqmlmp4ZVS0o5PwFBfCYmDb9ip
         oXS255n0I7cwHVgZrvwq5Kd+HJjsEVPeYZeYPDdzYXexsnUhchIRzb47TYJlrvyki5H/
         Gzml9x/F5BhGx95LwSg0uItpAnw63K+A+jMMyJJA5P2EDyFfJB8qWbudpct6ijCtKhbH
         Du4cp4mZFzM+ztFd1pbjxPVvqdMM6ppfvROzWfq8NDeIHeerfGVkiN0+Eqt7UBpy3n1V
         mxUw==
X-Gm-Message-State: APuU4Z8IgGsXSydADO3xNCvhfqIPDygKW7/dwYdafdmxPiCTRMT2j8RK
	X/j4aHYGmUefVIepDkewLM5ckpBZZRtZn9seUlErGcdPmMlDjIgumOkH9oPx4qvHUqXMZAkQNQ3
	UcG1sVEoBgQ==
X-Gm-Gg: AYBFou2edcRNmRZqO5SYLs9mFPPpWU+jR5JDhHTwVZBf+DQJQNXwCsX+BXxhyVEzfm9
	XNQ6PPzXEG7iLjY9SDbgGVwCkiGGDxjFXJd78OpvoMMwGW8GUekSBsMSirWY2eyvHD2lCb4r9ug
	9JpY5VrfQ84jtU61Gg89LDA+j/rSZ+Du7NuFS6wePFBLDwaIaGy9D3JK5VTYcVc3gqGl3Q6mWFz
	EluWUSLpc0zfVGAhvHB8GSw1Qxudm5ZyK17q6quf4YXuYd4InxLqfYWlpzDmmMVYywlGCza20oo
	5JOkGFQ297dnD7J3kaNAwh5Fln72nvp2gsAtn+ORA5tKlXfAs1hSuuXZUAb9w8Ky0fOr9y3BHY1
	wWs6e5Go0s43qyX4KKUGl3dTi+pTZjGevOZRMAtc8aUPAGRHSJFvq841MzABrplqdq5AtWOtcvw
	1egnGQqo5KXrfY64F2FcuM90IVw9FPT6Cqvg5T2sKsoC44WL6btZIu7GjPqEZIoeh5od5Nr/H0P
	UwW7GBd7c1opdzpSpNEu5+OSOO8EUiV0Nl0ItVsl7B0HC/Srx8z1hueRvvV2b67JOvmpCGsdRYo
	wWMgG1f3enlU+nKdUJPDRi6cszUFXXtZixuObq5UjRxjqKCrmN+9/gukS5iomR+noSl894WcUs5
	McsGo/Jh63Tt/C7hK2TMSr6U=
X-Received: by 2002:a17:907:ea5:b0:c50:5e10:71aa with SMTP id a640c23a62f3a-c510e290031mr543044266b.14.1795082050024;
        Thu, 19 Nov 2026 01:54:10 -0800 (PST)
Return-Path: <andre.draszik@linaro.org>
Received: from puffmais2.c.googlers.com.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123419838sm92276966b.34.2026.11.19.01.54.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:54:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] android-tools-conf: start adbd once a UDC exists
Date: Thu, 19 Nov 2026 09:54:07 +0000
Message-ID: <20261119095407.1118604-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 09:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132671
Content-Type: text/plain; charset="utf-8"

android-tools-adbd.service is wanted by basic.target. That dates back to
the original recipe, which configured the gadget through the Android
specific /sys/class/android_usb interface. With configfs,
android-gadget-start binds the gadget once, to the first UDC listed in
/sys/class/udc. It used to wait a fixed 3s (later 10s) before doing so,
but since adbd signals readiness through sd_notify, the drop-in sets
ANDROID_GADGET_UDC_DELAY=0, and the gadget is bound right after adbd has
started. Nothing orders that after the UDC has been registered: the UDC
driver or its PHY driver can be a module, which udev loads while it
processes the coldplug events that systemd-udev-trigger only queues. If
the UDC appears later, the gadget stays unbound and adb doesn't work.

Make adbd wanted by usb-gadget.target instead, which systemd's udev
rules start when a UDC is registered. adbd still starts after
basic.target, through the default dependencies of services. The same
override, applied from a BSP layer, made adb come up reliably on devices
with the USB drivers built as modules.

AI-Generated: Uses Claude Code
Fixes: b94dcd325625 ("android-tools: upgrade 29.0.6.r14 -> 35.0.2")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../android-tools-conf/10-adbd-configfs.conf             | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf
index 7971f319c3..b91b16ee11 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf
@@ -5,3 +5,12 @@ Environment=ANDROID_GADGET_UDC_DELAY=0
 ExecStartPre=/usr/bin/android-gadget-setup
 ExecStartPost=/usr/bin/android-gadget-start
 ExecStopPost=/usr/bin/android-gadget-cleanup
+
+[Install]
+# android-gadget-start binds the gadget only once, to the first UDC that
+# exists at that point. The UDC driver (or its PHY driver) can be a module
+# that udev loads only after basic.target has been reached, so start adbd
+# when a UDC appears: systemd's udev rules start usb-gadget.target when a
+# UDC is registered.
+WantedBy=
+WantedBy=usb-gadget.target
-- 
2.56.1.708.g77570a6a1d-goog

