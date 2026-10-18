Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5676ECCF2C9
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 06:00:20 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9905.1792303216617491069
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 23:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UMfzSuQY;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35943f55c06so1593278eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 23:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303216; x=1792908016; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sbq218vLjNiuQMeJQ9TMJ6YuczZhC9aEjqiEdaQF6M=;
        b=UMfzSuQYxnRVDhWx4U4+gVaRdTQM5Hn+Op2woU1Ojf7SoJwQUFn9n9LrVUCYnH2Upj
         pjFUJKcu9Enfwl8JshP5l4v3jWPEA25OBKxLbJ05vzJM84cHOei3VNkqucjOkSZQk5/j
         XLXALT8gHJEiNmVwOf3N2O+FRposJqR8hwNeKWpTasRPGlC6buIBaiYIcS2/mr7Oa5Rx
         v9WLnqnMzESnM6cLbJS+IU+xzJwpLEJxrgTTET+yS6Di08HzHUahXN/lZLftSU04tNxi
         RanFV3eiCefh7VJH4u2SvXLN6agDqXwiwqRNvFDt2oHnZ5mqiQx2FU2qLWzv4GQ3KaDr
         nwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303216; x=1792908016;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sbq218vLjNiuQMeJQ9TMJ6YuczZhC9aEjqiEdaQF6M=;
        b=zV8pyZFGJKL5mvMpng6tK9lYMoqX6AJDKqsohWs8b2jTaW90vnKKA7OYyKAFfCwyRr
         W5pveZZR/fS8zT4WhfrRnTDycVob1r8eB9BmPwQ6NrRgQnms9dptSZ1hfA0hN/j1tDbC
         NBP/QJOg1kZsEK0Q50dzRuinhfn7kZgipeszey3ylPIU1bsJZ1HAtcU1YVmZ7GKhFKzD
         XBekZI6ro7utL4/YaFbGDnCs+Uc2ZeXqqqQdOcvPI+ani8r5MreMF2rv6xhpSdDuxUz+
         kS0rjesjQGaIibVGQlIYVQln292cLyThOAeauu/CWKlouhObsi0fmavT92Wd8vJHuRFh
         GYlg==
X-Gm-Message-State: AFq9FYK4KHy9VLY7ejQ1QklVcXjcNcVwZP9KGkjjBr+T/F2DSKBrXKCa
	zrbUp4gIyBJRkM8nVo0bO6mt+4mWLqT54GGZsphTsOb82vI4S0TGuJeeRjaZ/cCwVSQ=
X-Gm-Gg: AYBFou2V3EWFJyG07bg4aON6nAzmIHM3HnRIE6Syn5uJhxd1Q9Nkt/f9z1P/pQ70xsV
	+JD1TQ0t33A5JJQ6TwrBzduLTQyZ0G+pllItPWpZBM+ohuMlExBfTkLY7sb1/gOQJXfVlH6mIlw
	CYZNkC0fOTAyu0U4HDTzkrbYEdbeI6iZ2uHnUcCCSuLudEyL5bbQIJzY/mtmXdTtofaqDy+mNmb
	qT3zPclTNlkRmGUAoGB6rZh791HOtJlkHwnNOEOi6U5j/g4DnLh7veMW0fdQ2OR8HBi4UC3L/fE
	pUTP+B3D9QKkVZI+uxOc5ISN16DaDLI4ycbExXS0n7BVfEepidpEhaU+JDPeZ4w2MvTpUu42Nhh
	261Mxv1QVcJf/ztmDTUk6nWl0R5NLfsPiIvjh1RzAv9rgeln2REI2hUkqwFvQwtrNrn85nOkDOA
	CU6dkQ0zCxaiOOFZQzrIhZ8RxiAunaM/PqIpWKhokcC1GL/qeOqalD6xWTNZqpci9D69UJvWutS
	pENrt2WoiNTZ4vqbMZ8ln8RnC0s3QLfKVntCLnvkEunnUmewSSGvj68THJ2l4YLnTVgW/+nIhJM
	4lJB+IxQt3uK3JH+xoUOkHjLaXUO0YC3/jhiQXgtTzLyWDrNSwT/a26jK8A30+rwdOMuK6pDJIP
	LFapGQGAqzCL06rzc61GGVIFPtxWfPCdIVIChnD1HV5eQTmgoQfhAbqj6Hj+wblyxHEOR36BqW5
	obDel2lDi5XeQzxRpTANYugfNyTpt6QMK+zmnVbHix2JPJ5Q==
X-Received: by 2002:a05:7301:e2f:b0:359:3991:ce1a with SMTP id 5a478bee46e88-3602e698e80mr9954183eec.16.1792303215623;
        Sat, 17 Oct 2026 23:00:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm19828646eec.22.2026.10.17.23.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:00:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-openembedded][PATCH] AGENTS.md: Add contribution guidance for AI agents
Date: Sat, 17 Oct 2026 23:00:08 -0700
Message-ID: <20261018060009.185838-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 06:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131094

Document the mailing list workflow and the conventions agents get wrong
most often: recipe-only commit summaries with the sub-layer tag carried in
the email subject as [meta-oe][PATCH x/y], the AI-Generated tag, and the
human contributor's Signed-off-by on commits and recipe patch files.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 AGENTS.md | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 0000000000..860dea93ff
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,78 @@
+AGENTS.md — Meta OpenEmbedded Layers
+
+Guidance for AI agents working in the `meta-openembedded` repository.
+
+## Making changes
+
+- No web PR workflow. The project use **patches on mailing lists**
+  (openembedded-devel@lists.openembedded.org) tracked via patchwork
+  (https://patchwork.yoctoproject.org/project/oe/list/). Don't assume GitHub PR
+  conventions apply.
+- One Git commit per logical change (e.g., one commit per recipe).
+- Commit message format:
+    - Summary line is prefixed with the recipe name, e.g. `python3-posix-ipc:`.
+      If the commit touches multiple recipes, list them comma separated, e.g.
+      `recipe1,recipe2:`.
+    - Do **not** put the sub-layer tag (e.g. `[meta-oe]`) in the commit summary
+      line; it belongs in the email subject only (see below).
+    - Check `git log --oneline <path>` for the prefix convention already in use.
+    - Body explains what and why the change is. If the commit represents a
+      feature addition, also how it was tested.
+    - Prefer explaining _why_ a change was made over restating what's already
+      visible in the diff, unless the diff is long/hard to follow or the reason
+      for the change isn't known — in those cases, summarize what changed
+      instead.
+    - Be succinct: use as few sentences and lines as possible while still
+      covering what/why/how. Cut restatements, filler, and any detail a reviewer
+      wouldn't need (e.g. exact test-run counts, step-by-step narration). One
+      short paragraph is usually enough; only add a second if a distinct point
+      (e.g. testing) needs it.
+    - The most relevant information about the change should be presented first.
+    - Reference bugs as `[YOCTO #1234]` when applicable.
+    - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc` tags
+      where relevant.
+- Email subject format:
+    - The sub-layer tag comes first, directly followed by the `[PATCH]` tag with
+      no space between them: `[meta-oe][PATCH 1/3] recipe: summary`.
+    - Generate it with
+      `git format-patch --subject-prefix="meta-oe][PATCH" <upstream>`, which
+      yields `[meta-oe][PATCH x/y]`; add `-v2` etc. for rerolls
+      (`[meta-oe][PATCH v2 x/y]`).
+    - Each patch carries the tag of the sub-layer it changes (e.g. `meta-oe`,
+      `meta-python`, `meta-networking`, `meta-gnome`). Prefer one series per
+      sub-layer; if a series spans sub-layers, set the tag per patch.
+
+### AI-generated code
+
+- **Mandatory**: any AI-generated code/commit must add an `AI-Generated:` tag
+  line in the commit message, placed _before_ `Signed-off-by` (if present),
+  naming the tool used, e.g.:
+
+    ```
+    python3-posix-ipc: fix feature probing instead of forcing -lrt
+
+    AI-Generated: Uses Claude Code
+    Signed-off-by: Contributor Name <contributor@example.com>
+    ```
+
+- Also add a code comment or other in-patch indication that the code is
+  AI-generated (recommended, not just the commit tag).
+- **Mandatory**: every commit, and every patch file added to a recipe, must
+  carry the human contributor's `Signed-off-by`, placed after `AI-Generated:`.
+  Use the contributor's identity from `git config user.name`/`user.email` (e.g.
+  `git commit -s`, or `git rebase --signoff <upstream>` for existing commits),
+  never one made up for the AI tool. The sign-off certifies the DCO/Developer's
+  Certificate of Origin on the contributor's behalf, so they must review the
+  change before it is sent.
+- In patch files added to a recipe, the header order is `Upstream-Status:`,
+  `AI-Generated:`, then `Signed-off-by:`, and the `From:` line uses the same
+  identity as the sign-off.
+- Contributor is responsible for confirming the AI tool's terms don't conflict
+  with the project's open source license/IP policy, and that any third-party
+  copyrighted material in the AI output is properly licensed before contributing
+  it. See the Linux Foundation generative AI guidance:
+  https://www.linuxfoundation.org/legal/generative-ai.
+- `Co-authored-by` should be omitted in favor of the `AI-generated` tag.
+
+When in doubt about a convention, grep `git log --oneline <path>` in the target
+repo for precedent before inventing a new style.

