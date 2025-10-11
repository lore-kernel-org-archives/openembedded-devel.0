Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC66CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 13:35:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.11618.1760189697540054686
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEW89REG;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso4353229a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760189696; x=1760794496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=beoLc7WzLrr+XCZpeXKIPtfBoqf7YdRkYAplLCXh5vg=;
        b=eEW89REGFfGHnWJNXbeTGfkX2Kt1Z92kUY1p/uyFcsDjxN8Bw/IVNYvTIiYiNUH3hE
         epQyiaQOgfMNyfcNbUsStfadQUNS+Wg+tL85Kvts77nRJYcHDJ1x8Ui5As/2DUDNip0V
         cv778rm4T4a/ADaxVpe2aXOqKn07eVyDGoP8bHL87s2ea6atdmMuck/TnWgwnf6ecnrV
         C6T9wYjQRQA6JpK5lEN2vT1c40Bm4bSEvZDfhIAZce1WI+fzxcFVLtsqB1r9Bbp5GGZu
         dsZDnY+djbt9mg/r/CVfV7lnCkqJgb/M4f7ff/xJxdQ7Ee8EUYaIkF/nGCCPDds+JaWA
         zg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760189696; x=1760794496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beoLc7WzLrr+XCZpeXKIPtfBoqf7YdRkYAplLCXh5vg=;
        b=vRZ3nH8RKBflgL5YEOEdy9QZkIgAxPyDtJC84hoKNbWpH0GDTxGCvc9MQnNTUIZKFy
         eSbJkx2e5+xdNfXHzL64L+qyV7izy0MKXh4gUpXoWt+FGRe2bnVk2Y/FVWycfhnaYwMd
         aVPqMYJeR8FsW5/0vxl23hYQ9irgi9dB4dA7uWMPaYbGGMJVzDinMt5Gl08oo1lSjGxP
         WJGWrjnltIOYl5RRxd4ucF1UMtiQNHPtfAOb2zkBR1BUwgNXOGOhcnf9T5EDi8GKaCnP
         KyOjAp7LKipRqDwBslTDe1lsS47hSTPuFcxYOgkIWJwaCMiR6bgancTlbjSfPnYmwGL1
         Eikg==
X-Gm-Message-State: AOJu0Yx1Mq3LV+kYKB1aQ60ANLcAlwpBjE32K3ad5XVn1wiUDXlOjDK8
	tG3ZD/Yb2vhoMC9Vt8UYwfM9L4QZnM1Ae/cFrHwPJi5MKsJAy3E0VKpKregVGg==
X-Gm-Gg: ASbGnctAy1tQQqJFzl+raWMhahbpjitvJIKLqozpBAUYZhEJpHzpv6gpchwiPFC0eyF
	SVQtsNEE8GbsCswqEnfbUHCQHHmFlQTbCUswQ5MGEZ2R1RpcGLV8pgseb4sW4hP+mRlaYUCjmDr
	E33mrJyLgRWFjPfTZ4s5/5pDXCLsTImulc/uUIyijJNPWlxAUyZC/lWWelbIHqYIli80ha+oRka
	IcdY6kGrvA2WwDHwRJpolUCwAsKrD/lfTMnUBydDcmfawry1vZ6h3FKIlDwtHI2GYP7Ain20pRj
	KqkEvQzpqNXYUPiS50kPLUt7wbGQCjr6Itbk23USNsSckR7g9+jUbly8ZcIOEdrH19nF3pV8Ixx
	D6JJH8yN2JQf5waZvjIeQC3hse5MCseoJThguMbo=
X-Google-Smtp-Source: AGHT+IH46C+yMjJ1bumB+aSmRnqVcWERsVLNYg1W+4ES4pRpZrpUJ+z1xbHLmEujRG6YWNVJpGyJnQ==
X-Received: by 2002:a17:906:f5a7:b0:b3d:9261:ff1b with SMTP id a640c23a62f3a-b50aa48d849mr1551447566b.5.1760189695317;
        Sat, 11 Oct 2025 06:34:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12b62sm485075966b.48.2025.10.11.06.34.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 06:34:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] etcd: patch CVE-2023-32082
Date: Sat, 11 Oct 2025 15:34:54 +0200
Message-ID: <20251011133454.2141295-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120494

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-32082

Pick the patch mentioned in the details of the report. (It was backported
to the 3.5 tree)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../etcd/etcd/CVE-2023-32082.patch            | 86 +++++++++++++++++++
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb   |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.patch

diff --git a/meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.patch b/meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.patch
new file mode 100644
index 0000000000..fe350265a4
--- /dev/null
+++ b/meta-oe/recipes-extended/etcd/etcd/CVE-2023-32082.patch
@@ -0,0 +1,86 @@
+From 021ad998bed830f903b96ee9dcf87a35ca60c148 Mon Sep 17 00:00:00 2001
+From: Hitoshi Mitake <h.mitake@gmail.com>
+Date: Wed, 29 Mar 2023 20:46:32 +0900
+Subject: [PATCH] etcdserver: protect lease timetilive with auth
+
+CVE: CVE-2023-32082
+Upstream-Status: Backport [https://github.com/etcd-io/etcd/commit/d1b1aa9dbe8065fb2cb36fe035daf701ccabc4e0]
+
+Signed-off-by: Hitoshi Mitake <h.mitake@gmail.com>
+Co-authored-by: Benjamin Wang <wachao@vmware.com>
+(cherry picked from commit d1b1aa9dbe8065fb2cb36fe035daf701ccabc4e0)
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ server/etcdserver/v3_server.go | 52 +++++++++++++++++++++++++++++++++-
+ 1 file changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/server/etcdserver/v3_server.go b/server/etcdserver/v3_server.go
+index 0184b8d18..c8ce8c69c 100644
+--- a/server/etcdserver/v3_server.go
++++ b/server/etcdserver/v3_server.go
+@@ -336,7 +336,32 @@ func (s *EtcdServer) LeaseRenew(ctx context.Context, id lease.LeaseID) (int64, e
+ 	return -1, ErrCanceled
+ }
+ 
+-func (s *EtcdServer) LeaseTimeToLive(ctx context.Context, r *pb.LeaseTimeToLiveRequest) (*pb.LeaseTimeToLiveResponse, error) {
++func (s *EtcdServer) checkLeaseTimeToLive(ctx context.Context, leaseID lease.LeaseID) (uint64, error) {
++	rev := s.AuthStore().Revision()
++	if !s.AuthStore().IsAuthEnabled() {
++		return rev, nil
++	}
++	authInfo, err := s.AuthInfoFromCtx(ctx)
++	if err != nil {
++		return rev, err
++	}
++	if authInfo == nil {
++		return rev, auth.ErrUserEmpty
++	}
++
++	l := s.lessor.Lookup(leaseID)
++	if l != nil {
++		for _, key := range l.Keys() {
++			if err := s.AuthStore().IsRangePermitted(authInfo, []byte(key), []byte{}); err != nil {
++				return 0, err
++			}
++		}
++	}
++
++	return rev, nil
++}
++
++func (s *EtcdServer) leaseTimeToLive(ctx context.Context, r *pb.LeaseTimeToLiveRequest) (*pb.LeaseTimeToLiveResponse, error) {
+ 	if s.isLeader() {
+ 		if err := s.waitAppliedIndex(); err != nil {
+ 			return nil, err
+@@ -386,6 +411,31 @@ func (s *EtcdServer) LeaseTimeToLive(ctx context.Context, r *pb.LeaseTimeToLiveR
+ 	return nil, ErrCanceled
+ }
+ 
++func (s *EtcdServer) LeaseTimeToLive(ctx context.Context, r *pb.LeaseTimeToLiveRequest) (*pb.LeaseTimeToLiveResponse, error) {
++	var rev uint64
++	var err error
++	if r.Keys {
++		// check RBAC permission only if Keys is true
++		rev, err = s.checkLeaseTimeToLive(ctx, lease.LeaseID(r.ID))
++		if err != nil {
++			return nil, err
++		}
++	}
++
++	resp, err := s.leaseTimeToLive(ctx, r)
++	if err != nil {
++		return nil, err
++	}
++
++	if r.Keys {
++		if s.AuthStore().IsAuthEnabled() && rev != s.AuthStore().Revision() {
++			return nil, auth.ErrAuthOldRevision
++		}
++	}
++	return resp, nil
++}
++
++// LeaseLeases is really ListLeases !???
+ func (s *EtcdServer) LeaseLeases(ctx context.Context, r *pb.LeaseLeasesRequest) (*pb.LeaseLeasesResponse, error) {
+ 	ls := s.lessor.Leases()
+ 	lss := make([]*pb.LeaseStatus, len(ls))
diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index 0794158a52..83847f871f 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     git://github.com/etcd-io/etcd;branch=release-3.5;protocol=https \
     file://0001-xxhash-bump-to-v2.1.2.patch;patchdir=src/${GO_IMPORT} \
     file://0001-test_lib.sh-remove-gobin-requirement-during-build.patch;patchdir=src/${GO_IMPORT} \
+    file://CVE-2023-32082.patch;patchdir=src/${GO_IMPORT} \
     file://etcd.service \
     file://etcd-existing.conf \
     file://etcd-new.service \

