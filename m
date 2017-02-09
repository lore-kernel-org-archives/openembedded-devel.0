Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id DA45971E06
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 08:39:31 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id i10so78352014wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 00:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=N4xBA4NkiJ8DC7B0TmqJt1ZtmnbUAWwHbkKcE61Xpb0=;
	b=ueRsT6LzwuruVf84MdPwKTLezuwyYd1rszuqOhT2h8UcBeHusRc1WGUQxMcPjcb0NJ
	v0RKSbkR55WmCDLtyzv7Cj/sD6NINml8gJNExyMZwXLhx++vCIYZIZXmwIRkNlbVghvp
	uwy64XxaG+L2J4LRVJUL4AxuHTTNhFqcpNrsoFk8CNWHk61/6OO2zuwUXXHwhQdOp8td
	q+XvZR/6aZxL5jsYoHhD3QeKaymYD+7kqWZVAsWGRlNn029G8+zeGy3ionVT5WD/cssG
	EEqMNG98M3xGRolaaSoU239F0iYvH9hcNypC6NGb5LuDTyB9ETU7S4q60quQA/Nlc077
	uD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=N4xBA4NkiJ8DC7B0TmqJt1ZtmnbUAWwHbkKcE61Xpb0=;
	b=HPJJFjboQAlZFlhPdF9WKZmf7F3iVqgOmVK+X60cM3m9F1apebHfSjiiI+n9yBhmAh
	49D25ZOCkIGtHnmysF8NAjGCqwa/77ODNvcJdJ8VUhH6xA7bXwHpBzhKmKQVfAnAkeYA
	138QrpBJlBS2lDLT1e0hKTWzHnyPFbugz6p72q3b/ZU6e6M48oYXNgh4jd3GIfD6ocO+
	rcPzTIt422ppffrou0rbvyhXgt1jKeS95Db5cUFSqIjGOgUP5ZZ/GP6J9j5VgYAJlyuI
	yfPsfJ2WbLeF+t7xBn4rUhIKCY6C7ux9XKilnolsaz7mwiYzxUOull+2p+iuPcFDM4z1
	Wy/Q==
X-Gm-Message-State: AMke39nVMRxVGcpCMUsU9fHEfjyavbnzoAbdSHSplubyjH+3O9WXnUtHY4MaECxu52OXjxVlx00Ye2vlFZuLzA==
X-Received: by 10.223.150.34 with SMTP id b31mr1715044wra.196.1486629571377;
	Thu, 09 Feb 2017 00:39:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 9 Feb 2017 00:39:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Feb 2017 09:39:30 +0100
Message-ID: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: core-image-tiny-initramfs failing to parse because of WIC (WKS_FULL_PATH, )
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
X-List-Received-Date: Thu, 09 Feb 2017 08:39:32 -0000
Content-Type: text/plain; charset=UTF-8

Running e.g. bitbake -e busybox with latest oe-core triggers this badly
looking exception:

Can we add some weak assignment for people who don't care about wic
or core-image-tiny-initramfs to continue using oe-core?

ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-core/images/
core-image-tiny-initramfs.bb
Traceback (most recent call last):
  File "/OE/bitbake/lib/bb/data_smart.py", line 412, in
DataSmart.expandWithRefs(s='\tout="${IMGDEPLOYDIR}/${IMAGE_NAME}"\n\twks="${WKS_FULL_PATH}"\n\tif
[ -z "$wks" ]; then\n\t\tbbfatal "No kickstart files from WKS_FILES were
found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
appropriately."\n\tfi\n\n\tBUILDDIR="${TOPDIR}" wic create "$wks" --vars
"${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
${WIC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct
"$out${IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n', varname='IMAGE_CMD'):
                 try:
    >                s = __expand_var_regexp__.sub(varparse.var_sub, s)
                     try:
  File "/OE/bitbake/lib/bb/data_smart.py", line 111, in
VariableParse.var_sub(match=<_sre.SRE_Match object; span=(43, 59),
match='${WKS_FULL_PATH}'>):
                 else:
    >                var = self.d.getVarFlag(key, "_content")
                 self.references.add(key)
  File "/OE/bitbake/lib/bb/data_smart.py", line 773, in
DataSmart.getVarFlag(var='WKS_FULL_PATH', flag='_content', expand=True,
noweakdefault=False, parsing=False):
                     cachename = var + "[" + flag + "]"
    >            value = self.expand(value, cachename)

  File "/OE/bitbake/lib/bb/data_smart.py", line 436, in
DataSmart.expand(s="${@wks_search('${WKS_FILES}'.split(),
'${WKS_SEARCH_PATH}') or ''}", varname='WKS_FULL_PATH'):
         def expand(self, s, varname = None):
    >        return self.expandWithRefs(s, varname).value

  File "/OE/bitbake/lib/bb/data_smart.py", line 426, in
DataSmart.expandWithRefs(s="${@wks_search('directdisk.wks
core-image-tiny-initramfs.wks'.split(),
'/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
'/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
% l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
''}", varname='WKS_FULL_PATH'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc) from exc

bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
expression was ${@wks_search('directdisk.wks
core-image-tiny-initramfs.wks'.split(),
'/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
'/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
% l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
''} which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH,
line 1)

