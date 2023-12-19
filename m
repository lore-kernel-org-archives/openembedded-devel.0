Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62307C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6739.1702967227966529652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsQyrIGQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3ab37d0d1so10762275ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967227; x=1703572027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LluqgEsQF18i5qijbNj+bXiIJ6V694SpPMrPHdqT+jA=;
        b=EsQyrIGQqaFpOfem/t2Ox5JdM4UY6CqhqGQGirN3aorANiP63OYpPlpuIwkC0GhnA4
         96OpWyri0bfezQ1/P2lgsDmPAN6WJpVP56a2V6581hj1oPtz21tz+G72gZbAL5bwAEfT
         Fxe+ahn+iQChwEkgwVqCqmAkxgJjcajiQS54pLJI1VjGYBft8rIxEiRLBRlysyKQaKtu
         Ob7XysJ4zr1F7WtiuhZLoPSFpG5gEQGePK8zhKe2No2l8hzIZIVzKC7ahPTwCgEfrSBi
         JgZoVCNHfzW2a+W/5HuURleMqOL3H9kiey7nt95vbvwOQn/7YPRdlQXzpIfvt1ZWvryF
         kgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967227; x=1703572027;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LluqgEsQF18i5qijbNj+bXiIJ6V694SpPMrPHdqT+jA=;
        b=LRnaxO5ZgDiaXG7gmp4KsjAhgOyRc3ZXhtvNT17dArMfuYm3VyajFU5QrABVpv+Bm3
         zkgvn0+ann0GLXXSq5OCtVG6LbQ3yY0hmxBLsRrOrMYGn6RvuSBg6Hsb0Qm7UIrfVuiE
         lIKaq4F8eY3mr7QkFkoa2bEz9xkaKHX+WlJB4vYS9EzWZVtuSQ4lMPA0popkCJ/GlQ06
         ZtzFTo5i/rYzfi5dMeIBKYvLhGrOZizCE+BmJj1hp8GlZdUFexXAm55GtQmU6V1uSNRZ
         jIvT1CxBuSkxn5QxYOTxt8alfBPd+R/gAhlNLH5hXAFW7NFK0QEHhigw5Mum74cPTPAR
         jRVw==
X-Gm-Message-State: AOJu0YzBuw0ORW+Ei8jFI+6S5LlAhKmBSAFYEgXzxX3Jzuh6P5TzMp4W
	GCqAlXQBInZPR3vlVPu8S7kRDycKdO0=
X-Google-Smtp-Source: AGHT+IEMHAtacO93e1dtBvanwDu00D6T3joAslYdsv+HpCaTt2STRT06Rp/mvKZ68IOrPCY7EGBpEA==
X-Received: by 2002:a17:902:da90:b0:1d3:adef:a49d with SMTP id j16-20020a170902da9000b001d3adefa49dmr1984524plx.117.1702967227380;
        Mon, 18 Dec 2023 22:27:07 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214003919.1179147-1-derek@asterius.io>
References: <20231214003919.1179147-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pyzmq: update to 25.1.2
Message-Id: <170296722660.1627685.17318844037005723155.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:06 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107562


On Thu, 14 Dec 2023 00:39:19 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-pyzmq: update to 25.1.2
      commit: 90393ce5153f2182b19c5bd476507758c2fffc4c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


