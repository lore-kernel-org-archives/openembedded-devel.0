Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1476.1793731028111521536
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NhfTjFbh;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso415085c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731027; x=1794335827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvqbfpZXZ5Vndps8UB7zUm/PShJGl/E7eJB9Jg0K0mk=;
        b=NhfTjFbhQCK1gA8UHpymUsXas5Tzx4E2V8zW7Jv0NYa4At6lnuDhC90v5WIJcqS6pk
         5snb/GyDjGWeHwcTLMwPLb++KUjhLXEk1CocPsewKSNW+FEo0X+DlH5Vkgeki6kyK9F/
         MuvipIITyGh/xaoQa+WViS28YItk8GEa/k9ZwU5A6yNda1L1wgw8RIIe00ze64vp1Kbo
         mg3oOlPIXZUuK44TJx4+6kghorU5Yz6+S0LXBAQI+y+j710GWuvZjqBqDM2xSZT6v0g3
         I2+YCcI9T7frz79ofvLrF/sHFxMP8dXgqhEp48lBs0o93tWjfsXO+P3G9sj2BHC8/rFV
         8k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731027; x=1794335827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvqbfpZXZ5Vndps8UB7zUm/PShJGl/E7eJB9Jg0K0mk=;
        b=j7OkhuTaXwPVUNTyJ+vIPDHYV+gC+XkwENYIwlhINelbsHXKFrHFW8d14oTOXwhXyY
         eHb9clVzkqYpDfnEOR6geUNtzoTs0a/HlbFooCY4zvC30MkOT2LQXyuBDGe3dAkdQnfR
         owqViYcLh50j32CEuiZFcXo3xs7pBg2/BflbwtYolzun+JOzX+9h6xWrCp5OgunRjjIW
         6qbvIwWWYcdXjgVZ6rzAhFgh6/Q7DXUTRkHdboy8w7btAYIVHfjCTo7bUko/5wyWnjAu
         Fro+QA1XLxV8VoQmgHxRjLqoh/kty549BnZIp7dcVu7DoNsFk2ZjkqQFgW8FRpK0gQWs
         QubQ==
X-Gm-Message-State: APuU4Z/Sn0Rei+Hogi7hWZwliugoh+Au8yo2m2EwnYGpCtM2WjDhvQ+W
	K8j1dajedM4bRLRLXEYH4gonArrIGv33hFYuaOfhI0Fzhx/O81cfdbcqBMUT9A==
X-Gm-Gg: AYBFou1jAUjua6Tn2Bo4thn6n7gfkCUXKom4iEpcFjWhB/hu+YFlqhc/tVDpCY0PF23
	YIh+z6WQCllhqI7vw9PPF15deRx2agHJxhyKjzoO/CmwfjPowiWnAOKtWzHognIBVFV71U35D29
	DNh5L87/jYrdNCjAZBm962vgZhsCEQ9ytxOcQzoMT68xHpIzLy0zKdh+TBsIeU55puOyM+rJqiK
	DdwG9XSljv4h+1PqA43bY1cCPMsO99C0x0q2VAiKZ/BcMXjZq8dpIsRygLl42k3PqvMPpPc0Nhm
	/21D/b+j4y60BbmzAUw/+3zdMlhNrYdd+asB1NEnbuc+dwyRA2p7OKFPJaMLGyUIdvx5kU1Y2lP
	BsnMkpR6LgOoXMABeVRAfn5yuGs6Dn5TuUf4S0CLzrE0oCnzAESCDHpikCBKraizIqy31Q5zjz3
	pQH9y8wH2HXh3GcGCqdHB5HbtkUVBFX5P2Ruvp+8fnZwl4HhVnr1PcQAiBT0OIUOlDhD3HRs3El
	fvq+tuQWhscHdVI81T5/LC2OhXbMVtDbArTLMNluz6tlFGokY9x94PKUnCaVAMNE0vB696011KP
	hZwV00WrMRHhwrqQQTXjXYXyfc7ET98cl22M53lORtgyV77rwPwElKmr7zS1Wg==
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr20235139c88.20.1793731027274;
        Tue, 03 Nov 2026 10:37:07 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/20] psqlodbc: upgrade 18.00.0005 -> 18.00.0006
Date: Wed,  4 Nov 2026 07:36:31 +1300
Message-ID: <20261103183640.919438-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131809
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/postgresql-interfaces/psqlodbc/blob/main/Changelog.md#18000006

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../psqlodbc/{psqlodbc_18.00.0005.bb => psqlodbc_18.00.0006.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_18.00.0005.bb => psqlodbc_18.00.0006.bb} (97%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb
similarity index 97%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb
index a770b60db1..086d2bd829 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0005.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_18.00.0006.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://run-ptest \
            "
 
-SRCREV = "f6da5647355b110fc9cc005100e23ba980e20e33"
+SRCREV = "96fa03dbc968c40920c907bf18d3b4cbd8efeebc"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
 
 DEPENDS += "postgresql unixodbc"
