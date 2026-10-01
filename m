Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11510CA5FD6
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:21:12 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15309.1790871667602082085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=i7AaSzKn;
 spf=pass (domain: konsulko.com, ip: 74.125.225.140, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so37631795e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790871666; x=1791476466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KTe2xJwCfDn5YXtAvC5/Nc/I8SBCcFTwa5+R4XysM0=;
        b=i7AaSzKn81b+T/AxWY/SEduR+w5Zrcu6nWRxwaE8ACH0TBMSkn2DHQdJ9Qs5svcy3S
         euVYRgFOKXQtNrWS/DOaN08y1feC0r61bCPX8R/cxCWnBblyvgi5+gLsSC4dZZBHcy2K
         MM+cNwZKYRZVGIUDjLyQWhTtGIne9CHHL6EZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871666; x=1791476466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KTe2xJwCfDn5YXtAvC5/Nc/I8SBCcFTwa5+R4XysM0=;
        b=ZABXPiUNG7XJ5vFtOWJNyCl8M+lk8fIYFCg/RDKkwzMhZeLby3F/gtyTDOHqwwqGtG
         5yCmcASUwsOgXB80+vtWgfLJoj/0hWtUTS7LCYNFtKQU5iIlKeppBK0Yp6wRZPbOnMG5
         trZCxkd9oC3wwvX1Fo+AQZ8DBUJM8GOWXznaRgHzumzH+RbKswY3DYoMKgFiCm0aFqV9
         rZ9GqAcFVwaxWUUbQO3QNCsuf77C0GRiOwHsRuySpVlD2dUVQu8Mr+DvAWkJIQunIrYQ
         UeHMZL2+iA2WmnoAds5Nr9rwIssYEAPyGrxoPVzvmQu373P0VHxFSQJkQIJBjMiW8Nzg
         p01Q==
X-Gm-Message-State: AFuF++lBaE2x99tWzSghLhyZmjNdFVHKJpIgaMJMfLfFm1qUZH5wHEd6
	PXvhxAeg+9kv9HzZGrL8u5TjGIhbtL5XYrwfTS6QrNEBX0DHujy+lC+oHpd4o3KAv08KVP/1/Pf
	3NgHp
X-Gm-Gg: AYBFou012JpGJIYAsx4ftmEWN1Zt5/xsxhJtCL3EXhY4lbGOX307xVJGOh/AvyFAXUS
	IrokBQ3lhAhB7WmaUBadJWVC2M7XEf18uEgMA+fPvjA0y9EKDV/Q1vTVgfdj0/Y+tQr9t7CjLQC
	8lugW9ywBNTGeNDFpdiAJh5G1qbG10fmr9UcnQ/l7ZCtXRLD/i7675l9T7XbMlOmX9XOL6REeuQ
	SVbpV0bhqyIrTdS4rdr/2r0ajNXA3mdHJoMTcj0Tf4MrMbo9XdKZbn7uTVnTdgQPJ8WTtw4eSQY
	dRz4cydLAi2IIQHGfDiGQNCM6f8cKVIf65MaQT4KWaf7MuV11ReeIGzehRigdqetILfwfW4zzb1
	8lSAZGLKKCBQjFbd88tuDhg664Z4SUdQ4734OOg86Xgk0AKj1Hjv7VEzmQBQq5vuUtnHS3rHoKH
	HcpK0QodKNeNY11hEDMTG+gyIkJgTjLSZWy3H2oHqSZPaBXwldsUV8X0mUVepPXnDqDDnahjKFI
	uG8qAw+s8OI9fnoKRR4mwmEuqtLEhPlvM+PrjWgPGpxlfNu/8B7SWJf5kbcZDpjMMA6zDBeEPEX
	ZhrpHDUrdnkTnuWopHoDew0=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr2322905e9.27.1790871665700;
        Thu, 01 Oct 2026 09:21:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db63ef8sm4010344f8f.38.2026.10.01.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:21:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-msgspec: Upgrade 0.21.1 -> 0.22.0
Date: Thu,  1 Oct 2026 19:21:02 +0300
Message-ID: <20261001162102.2927672-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001162102.2927672-1-leon.anavi@konsulko.com>
References: <20261001162102.2927672-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 16:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130596

Upgrade to release 0.22.0:

- BREAKING: Setting gc=False on a struct type that has a weakref
  slot, whether from weakref=True or from a base class, now raises
  ValueError. On CPython 3.12 and later the weakref slot is stored
  in a pre-header in front of the instance, so releasing an instance
  of a gc=False type with that slot corrupted memory, in most builds
  crashing the interpreter outright. The combination worked on 3.10
  and 3.11, and the restriction applies there as well, so that the
  same class definition behaves the same way on every supported
  version.
- Add frozendict support on Python 3.15+.
- Support passing a callable as decimal_format to
  msgspec.json.Encoder and msgspec.msgpack.Encoder for custom
  Decimal encoding.
- Support Literal[True] and Literal[False] types.
- Publish CPython 3.15 wheels, including freethreaded builds.
- Publish Linux riscv64 wheels.
- Support the PyEmscripten (Pyodide) platform.
- Fix handling of PEP 695 type parameter syntax (class Foo[T]) and
  of types.GenericAlias instances in type annotations.
- Fix NameError when creating a Struct with an unquoted forward
  reference on Python 3.14.
- Fix a crash on incorrect typing.ClassVar annotations (#1097).
- Fix an AttributeError when converting to a Struct type defined in
  a namespace without a __name__ (#1072).
- Fix overriding an inherited field alias back to the field's own
  name.
- Raise ValidationError instead of SystemError when convert receives
  an out-of-range int for a float target (#1162).
- Report raw rather than the misleading any as the expected type
  when a non-Raw value is given for a Raw field in convert, and
  therefore in yaml.decode and toml.decode.
- Fix an empty expected-type name in validation errors for a
  required Raw field in a TypedDict, or a Raw field with a
  default_factory on a dataclass or an attrs class.
- Correct the error messages for out-of-range Meta length bounds.
- Fix a reference leak when decoding msgpack Ext payloads.
- Fix backing type declaration of Ext.code.
- Fix a reference leak in msgspec.to_builtins, and therefore in
  yaml.encode, for array_like=True structs.
- Fix reference leaks in typenode_collect_literal,
  Meta.__rich_repr__, ms_decode_bigint, and Encoder.__init__.
- Fix msgspec.inspect.type_info and msgspec.json.schema crashing
  on mixed-type Literals such as Literal[1, None].
- Place null last in the anyOf generated for optional unions in
  JSON schemas.
- Fix minItems in the JSON schema for array_like=True structs whose
  fields are all optional.
- Use [] or "" rather than a Python set or bytearray object as the
  JSON schema default for Struct fields with a set or bytearray
  default_factory.
- Preserve JSON Schema metadata and string constraints in
  propertyNames for annotated dictionary key types.
- Fix msgspec.json.encode raising TypeError for a dict keyed by a
  plain enum.Enum with str values.
- Fix missing GC traversal and clearing of some module state
  members.
- Ensure an exception is always set on allocation failures.
- Fix compilation warnings on Python 3.15.
- Report the leading argument of the encode and decode functions
  and methods as positional-only in inspect.signature and the
  rendered docs, matching runtime behavior.
- Add overloads to the Meta type stub, so type checkers reject
  mixing gt with ge or lt with le.
- Many type stub improvements and fixes.
- Document the differences between msgspec.structs.asdict/astuple
  and msgspec.to_builtins.
- Document that omit_defaults ignores fields with a custom
  default_factory.
- Fix the msgspec.json.decode docstring to say dec_hook should
  raise NotImplementedError for unsupported types, not TypeError.
- msgspec moved to the msgspec GitHub organization.
- documentation now lives at msgspec.dev.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgspec_0.21.1.bb => python3-msgspec_0.22.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgspec_0.21.1.bb => python3-msgspec_0.22.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb b/meta-python/recipes-devtools/python/python3-msgspec_0.22.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-msgspec_0.22.0.bb
index f12882e4c8..23bfac7ce4 100644
--- a/meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-msgspec_0.22.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jcrist/msgspec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c21402f8022478021f697044388b97c4"
 
-SRC_URI[sha256sum] = "2313508e394b0d208f8f56892ca9b2799e2561329de9763b19619595a6c0f72c"
+SRC_URI[sha256sum] = "0a13624a4969159fe35d8c2a3d377b2b61bbd8585e327440d5e52725affcce38"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3


