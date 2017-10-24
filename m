Return-Path: <fffonion@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0658E60746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 18:29:02 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id t11so15894567ywg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=BDxF//tX9EuWujP5X2ew7VeRbHiGKfgLAT4dZlSLWC4=;
	b=NDEIRV31fKRiJqvXEgAAkSQr65bcq8oS+JHYPOUaZSkk6daXOYQGGE+lIdgEa27Ern
	fjM3F+Qo2BdnJnFYZz7F10y+tlxp8Vf+Zbi0ATCeEqQluRR5cno5D9qHGegJlNqsRYnB
	Ec4AOSDlmLZvElP6c1I84k4y9URgauadwcZQq94O7/di0AvXmOMZW0W4egYIUvUFugDd
	wmw+luyTw5tQLa+qDUa5UHJJKY/RcguelupahzFRH334wlfXN8+IJnIC+/qdMZ1Wctex
	E9DPzSvq3YxqBeVlo7xPgZ0T28DtqVEpma9T+dQ06PfWu9g/btbfnfXj+8JoOUHrYWnl
	cg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=BDxF//tX9EuWujP5X2ew7VeRbHiGKfgLAT4dZlSLWC4=;
	b=KRQaEf+lQ+DfYiPzpKhP+cQ36C8JUOxcvyprqcJZplUGWkqS9ii+8fATFPLsLlN0R9
	S4wRGStbAu6Qaqa/awzV/iCAfyVceiWVKDesYpPVlrVaIbIhLayydzd0IfSVJanPPLmh
	dWnkGDQA2uWgdEDDNWO53WNkfj9W78oCr/6kTruNB4Zbn5hMrwJcmZJQ7H6B39rYWkfo
	NysHIpnBb4rknmWErJjgKdd9wBmWON4AkkQqs7HPzWfCfiCKShrATkhb/OYWbwkLVFrZ
	U63a2a80D4+2ZOsDkZ1Rh/UvjXSw/uA7LFuyk5vecV+7g3WzrbNWG0QonqWBO/P59oQJ
	D/Tg==
X-Gm-Message-State: AMCzsaWPfp9TZfPZVETxJu1vjtPTPnr3Z/WdAtUU4tywIoeFRs7oYRQn
	ojCxofxcwnt0IDlRr88o3Bt/L0ebyuVHoIzrtouGmw==
X-Google-Smtp-Source: ABhQp+Q4WAkNhKtd/YtBkT8UFxpvUe3lLT8KIH/MWMfYsxtVrutIyRNMDcGQS8aWwhuOzJZZHf9/ROzvP04cpr0tx3s=
X-Received: by 10.37.200.134 with SMTP id y128mr11686778ybf.43.1508869743862; 
	Tue, 24 Oct 2017 11:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.80.133 with HTTP; Tue, 24 Oct 2017 11:28:23 -0700 (PDT)
In-Reply-To: <CABR-LLePnTZhs_WjxRbvh61Xxj6sp+5nWPO34vS2-dv8aoB1FQ@mail.gmail.com>
References: <CABR-LLePnTZhs_WjxRbvh61Xxj6sp+5nWPO34vS2-dv8aoB1FQ@mail.gmail.com>
From: Wangchong Zhou <fffonion@gmail.com>
Date: Tue, 24 Oct 2017 14:28:23 -0400
Message-ID: <CABR-LLcPJyhzXh7DN19OVVxFODHhqM0WuCSGoNcpz_TQYYDgew@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Tue, 24 Oct 2017 18:29:03 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
The nginx receipt hardcoded size of off_t to be same as ptrsize, which can
break large files support on 32bit machines. The http range header will
fail with a code 416 on files bigger than 2G. Changing it to 8 will fix the
problem.

I don't think hardcode off_t to 8 is a neat way of fixing this. Is there a
better way to detect large files support?


Author: Wangchong Zhou <fffonion@gmail.com>
Date:   Tue Oct 24 14:21:35 2017 -0400

    fix large files support in nginx by setting off_t to 8 bytes

    Signed-off-by: Wangchong Zhou <fffonion@gmail.com>

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 4a97e2670..4cdf892c7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -57,7 +57,7 @@ do_configure () {
     --with-ptr-size=${PTRSIZE} \
     --with-sig-atomic-t=${PTRSIZE} \
     --with-size-t=${PTRSIZE} \
-    --with-off-t=${PTRSIZE} \
+    --with-off-t=8 \
     --with-time-t=${PTRSIZE} \
     --with-sys-nerr=132 \
     --conf-path=${sysconfdir}/nginx/nginx.conf \

