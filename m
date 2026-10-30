Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8904.1793358199685283250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MpqMl50l;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c46822eefb6so67870066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358198; x=1793962998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOs1MDre9GKNxSqiDfOqkiz/96qfc1bREnCzhr7z1j0=;
        b=MpqMl50lwuGgZ3/1mqP74rlpsDrMJyZOEBY4UPqw393R1TvqxS7FneTrzRldLhW2iP
         uyDDIEqwm7E1kJDTSVNHbwYeHXdOjOoi7j11H7eFheY1JhK8v1VrmQixSBe87KTZ8Lno
         5IcZ6V2wy+OcogAWcJPnZ3KQbWME8p87APxI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358198; x=1793962998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOs1MDre9GKNxSqiDfOqkiz/96qfc1bREnCzhr7z1j0=;
        b=Fx9lQhNpsgNxMey+wjHd0RnjSRL7DPnbku8nmXRkIPfzgLhMsXnxXD2zed4bafoakA
         2w4etxV9FxCm/sJAaTdx+V2U3F7W3Uj3YYC+6mNybVOjpB2KDhWnKVLanUO719G7k3cY
         +B+umjFLFu0lD5tfMspuWvsnGn6zvZGqeCme1yV95dfI/dFjlh4zjZrgAjpx6EVPsyCV
         AT+gOW2VuFKpbXG6SCB3GWKySKfhtei7M4e8IIRsJL+rGKBRM6Zu4smcT0t6bEYOnIFj
         93PacEjChNgDAHJDvCaqx7bE47m4Ui2el83PTGWhQt2TRVKKGo19GIAA9SoY7r682+nv
         G0qQ==
X-Gm-Message-State: AFq9FYKAlo2WlinY4iYmgToOoP4/QDXGS54Np0/3279C3uHmy01ugZeg
	1Jc00ffYpbil0yYLp+CGq87HkayC2TEemiE9WLtErrSSX0iPGXHmREoQO4zzwCC3qXT0mnMV4Fy
	InAsv
X-Gm-Gg: AYBFou21wKoWVSwm6o5ugJ+ye4mN5mBB/d1oeRCZIGhgMEye9w0JEqrfsUKabRKdH1S
	0dWRT9W3/PvPWCRCiYv1yg+EuQ12z05+UQxUWMrZDBXN0zD98m5WEGZwQ6uBvOrb/kJXIVgkesP
	Zy0kAXU4LCTQ0/Giv3GkYJSutsK2wL4s+ZfiUrlPAlhTSzQaT9J7CMiOVg9RP0WqgMhpMBjlYX1
	0GHFvbxJ5IRW76OQT1mSV3bzU8+5NsIGTZLB1dIamZys+lxt6QvurG9y4tkk0gvIklO2HpMZkj9
	B+s0RgWWh5b4//Thn0Jt6p7emlXrA6XUF97uJ0i+AyCc8rvVjZwTQwGWRUlmKsJyUjKuoxGh8g6
	tMhcmOI6ZFszl0l8UAAqy98ecCCjwaz3oPIRFhdJxEVVAXChMwyWF1Go4kI7ynhDMAJLBuywXxA
	dOz9yV2hEFa9UlWMOHq5fvjuZ2VhBeSPYLAMXxCD93TF1JHWVmGGPRzX3twFmbmu1HysC5b27uW
	dw64RRknO7uH0qNdftQ5wmyJUbGHb6CSkEp2GaaPROXicNvE97dSKa4ouXMHZXpxk672VfXUFRX
	CgUwKS95AEsgxWofk8QcchZkGdHzv4UCOl6RZEReQP5ZmCZuN4U2hEMu3knBLjYevTdmzwFxMU/
	83WHInxUS99MEgrvQ4A81a5XzDKJFx17g/cOl1R1QIrHOC1ch/v45CC9rLFEAi2Ze5HCXEs25yY
	k=
X-Received: by 2002:a17:907:6ea5:b0:c46:cc9e:a14d with SMTP id a640c23a62f3a-c4ca7ac23c4mr158022566b.49.1793358196676;
        Fri, 30 Oct 2026 04:03:16 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/25] python3-configargparse: Upgrade 1.8.0 -> 1.9.0
Date: Fri, 30 Oct 2026 13:02:47 +0200
Message-ID: <20261030110309.1124614-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131685
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.9.0:

Behavior changes:

- A false value for a flag now overrides lower-priority sources

Previously, setting a flag (an arg that takes no value, such as
store_true, store_false, count or store_const) to false in an
environment variable or a higher-priority config file added nothing
to the command line, so a true for the same flag in a lower-priority
config file still turned it on. Now the false value counts as
setting the flag, and lower-priority config files no longer set it.
For example, VERBOSE=false now wins over verbose = true in a config
file. Args that take a value are unchanged.

- A bare -- in a list value is now an error

A list value from a config file or environment variable, such as
items = [a, --], used to put a bare -- on the command line, which
ended option parsing and turned the user's own command-line options
after it into positional args. It now fails with an error that
names the key.

Fixes:

- Options after -- on the command line no longer block other
  sources. In prog -- --level, --level is a positional arg,
  so environment variables and config files can still set --level.
- IniConfigParser.serialize() escapes % (#364), so values like
  %Y-%m-%d read back unchanged, and a saved %(name)s is no longer
  replaced by another key's value when the file is loaded.
- Saved config files keep store_false and store_const values.
  write_config_file() now writes true or false according to
  whether the flag was given, rather than the value the flag
  stores.
- ConfigparserConfigFileParser reads files that only have a
  [DEFAULT] section, including the files its own serialize()
  writes.
- ConfigparserConfigFileParser round trip: values written by
  serialize() read back the same in more cases (for example strings
  that look like lists, and list elements containing # or ;), a
  value that will be cut short by a # or ; comment now produces a
  warning, and interpolation errors name only the key, not the
  value, which may be a secret.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-configargparse_1.8.0.bb => python3-configargparse_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.8.0.bb => python3-configargparse_1.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb
index f44247383f..3d9b635f8a 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "22a417f4d7b00149f0af82ef7c491f8ecc4b1d5454633fd319b386f5eb806f92"
+SRC_URI[sha256sum] = "48d9c22affe4ac419b4dd0691fa929d759e1f99574be41826785f2dbf3da63a5"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

