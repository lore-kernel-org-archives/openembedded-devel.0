Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.213.1794419955330465588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E1zQ/ho5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: kshakir@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtSEJ2980850;
	Wed, 11 Nov 2026 17:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FLsLgloyunaMAHvAZsPgauHB0m+qA9pYRdT
	YsjHTRW4=; b=E1zQ/ho58PpBc+aMpl/N9mSs/i3tP2OQ8Ntyd7I0Xx+z4Jx3dkH
	uFWl+txQju2oMbA+ii/HQaH05rdoT4V2PQR2seiUmxeo6pkGi2lqynL4G5RKOP8E
	fFSNOj6PtPgGA7vhpD4l3xJsGzldu0NZWpOyF9aBZYTwsGXoVJATubK0kmMDh7ls
	kiiRQqQ+K2oK27eszaAzt3iV7c/qXD6RrDH8+sULp9m957VXzSRM1yZI55xB/FqH
	WfewhdpMtXWoQnvHt2+cQAo3gTuW8nOkrdik/rRT0JWQ8xAEeedgKNBnkj50fARI
	w1HOi32wZXA7xdrF+Kbv43UVCo86mXjxwtw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksmag8e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:59:13 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHxDAR2575350;
	Wed, 11 Nov 2026 17:59:13 GMT
Received: from las-colo41-d19-20.qualcomm.com (las-colo41-d19-20.qualcomm.com [10.37.19.117])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ABHxC5d2575345
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:59:13 +0000 (GMT)
Received: by las-colo41-d19-20.qualcomm.com (Postfix, from userid 2366661)
	id A900C41146; Wed, 11 Nov 2026 09:59:12 -0800 (PST)
From: Kemal Rasim Sh <kshakir@las-colo41-d19-20.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Subject: [PATCH] docker-moby: preserve gids during docker exec
Date: Wed, 11 Nov 2026 09:59:10 -0800
Message-ID: <20261111175910.1620396-1-kshakir@las-colo41-d19-20.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: cajusozAcaLoieOR4BiB7DcEiAsJ6Kju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX7XN90IF1Mpmg
 5Qvj/fhrjTX6P57qlcQhFSi/1HTKepoadGZ//D5lf1MEadwp1GLFx3kA645mOS9xh07pHPWOyxE
 52L7u5MiHcqgZE+NfR4RwLvF6CRQxLQuwMb1kXuECI8dp3Eg/AK0o4VmrmDOQ1DFXNls15n4DnK
 eP3XRrAFidNQDyDQPYAxUFdJcKSMzcosrPiM0XkFPD/GEqK8VA+rOu6WAqWjCAWhlWd+Op0pqpt
 /5cjynkhYJgMXUVxCIOkYyb2kbdVF7uHhT5SFjSFGuXaAWXQKg02lBQi1CE1lFdEa8fPlwezA5O
 mbbCtNqdxPU88dvyd7mjHdALoMApp5BEtiOrS4RUhay6LuZ+rAhvIjXSqy13B3aEkvLr7jKmx+n
 cRrlKOl0Nr1jVhcr+gbumhaJwBmxr18Lv44fDxUYBNhYKegCPDMALdQ2Tgl7pcbMWSGTTezijAw
 vxbO7nvIXwMpgaGZQ5Q==
X-Proofpoint-ORIG-GUID: cajusozAcaLoieOR4BiB7DcEiAsJ6Kju
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4acf1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8
 a=A1X0JdhQAAAA:8 a=GFwbhVXWLe-BoAFTT8IA:9 a=3nWjig0DUKXJB_ZfKOX2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX63p2u8xDTEXv
 MSxauGIFqFNTPf58Gh8p4P3XmPyJEiTEyftlxjtynGHS6/s8ukH1LmSWkLYuXCXnqGhg2wMlBpU
 9XPuDETL+zLQwlWT5qWCJi7jNIve6yo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132133
Content-Type: text/plain; charset="utf-8"

From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>

Processes started with docker exec do not inherit all
supplemental groups assigned to the container when it was
created.

When OCI additionalGids are injected through CDI or other
OCI runtime modifications, the container init process
receives the groups correctly. However, docker exec rebuilds
user credentials and drops the original additionalGids from
the OCI process specification.

As a result, exec'd processes may lose access to devices and
resources granted through supplemental group membership,
leading to inconsistent behavior within the same container.

Preserve and merge the original OCI additionalGids into the
exec process specification so that groups assigned during
container creation remain available to docker exec
processes.

Before:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 1000

After:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 981 987 992 993 999 1000

This backport also includes the CDI additionalGids fix
required by the exec path change.

(cherry picked from commit
5c36dadb2543835d79eb4d398cfc9da507f6ff882)

Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  2 +
 ...-daemon-preserve-CDI-additional-GIDs.patch | 96 +++++++++++++++++++
 ...preserve-OCI-additionalGids-for-exec.patch | 61 ++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
 create mode 100644 recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 9768b306..c4c79110 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -54,6 +54,8 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
+        file://0001-daemon-preserve-CDI-additional-GIDs.patch;patchdir=src/import \
+        file://0002-daemon-preserve-OCI-additionalGids-for-exec.patch;patchdir=src/import \
         file://CVE-2026-41568.patch;patchdir=src/import \
         file://CVE-2026-42306_p1.patch;patchdir=src/import \
         file://CVE-2026-42306_p2.patch;patchdir=src/import \
diff --git a/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch b/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
new file mode 100644
index 00000000..ee4687a9
--- /dev/null
+++ b/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
@@ -0,0 +1,96 @@
+From 704210f9e6d44af1501c7564c82a98653b059b7a Mon Sep 17 00:00:00 2001
+From: Evan Lezar <elezar@nvidia.com>
+Date: Fri, 8 May 2026 00:46:21 +0200
+Subject: [PATCH] daemon: preserve CDI additional GIDs
+
+CDI injection runs from WithDevices and may append supplementary groups to process.user.additionalGids. Docker's WithUser option previously ran afterwards and replaced Process.User, dropping any CDI-provided groups.
+
+Resolve the final container user before device injection so CDI edits append to that user, and add regression coverage for a CDI v0.7 spec that injects additionalGids.
+
+Upstream-Status: Backport [https://github.com/moby/moby/pull/52579]
+
+Signed-off-by: Evan Lezar <elezar@nvidia.com>
+---
+ daemon/oci_linux.go      |  3 ++-
+ daemon/oci_linux_test.go | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/oci_linux.go b/daemon/oci_linux.go
+index d7a8859d6be30..668891e2672d8 100644
+--- a/daemon/oci_linux.go
++++ b/daemon/oci_linux.go
+@@ -1015,6 +1015,8 @@ func (daemon *Daemon) createSpec(ctx context.Context, daemonCfg *configStore, c
+ 		withCgroups(daemon, &daemonCfg.Config, c),
+ 		WithResources(c),
+ 		WithSysctls(c),
++		// Set the user before CDI device injection, which may append supplementary groups.
++		WithUser(c),
+ 		WithDevices(daemon, c),
+ 		withRlimits(daemon, &daemonCfg.Config, c),
+ 		WithNamespaces(daemon, c),
+@@ -1025,7 +1027,6 @@ func (daemon *Daemon) createSpec(ctx context.Context, daemonCfg *configStore, c
+ 		WithSelinux(c),
+ 		WithOOMScore(&c.HostConfig.OomScoreAdj),
+ 		coci.WithAnnotations(c.HostConfig.Annotations),
+-		WithUser(c),
+ 	)
+ 
+ 	if c.NoNewPrivileges {
+diff --git a/daemon/oci_linux_test.go b/daemon/oci_linux_test.go
+index 9e2c361a83a19..fa0a442a0bc18 100644
+--- a/daemon/oci_linux_test.go
++++ b/daemon/oci_linux_test.go
+@@ -2,6 +2,7 @@ package daemon
+ 
+ import (
+ 	"context"
++	"maps"
+ 	"os"
+ 	"path/filepath"
+ 	"slices"
+@@ -76,6 +77,45 @@ func (i *fakeImageService) StorageDriver() string {
+ 	return "overlay"
+ }
+ 
++func TestCreateSpecPreservesCDIAdditionalGIDs(t *testing.T) {
++	cdiDir := t.TempDir()
++	err := os.WriteFile(filepath.Join(cdiDir, "test-device.yaml"), []byte(`
++cdiVersion: "0.7.0"
++kind: "example.com/device"
++devices:
++- name: foo
++  containerEdits:
++    additionalGids:
++    - 1234
++`), 0o644)
++	assert.NilError(t, err)
++
++	origDeviceDrivers := maps.Clone(deviceDrivers)
++	t.Cleanup(func() {
++		deviceDrivers = origDeviceDrivers
++	})
++	RegisterCDIDriver(cdiDir)
++
++	c := &container.Container{
++		Config: &containertypes.Config{},
++		HostConfig: &containertypes.HostConfig{
++			Resources: containertypes.Resources{
++				DeviceRequests: []containertypes.DeviceRequest{
++					{
++						Driver:    "cdi",
++						DeviceIDs: []string{"example.com/device=foo"},
++					},
++				},
++			},
++		},
++	}
++	d := setupFakeDaemon(t, c)
++
++	s, err := d.createSpec(t.Context(), &configStore{}, c, nil)
++	assert.NilError(t, err)
++	assert.Assert(t, slices.Contains(s.Process.User.AdditionalGids, uint32(1234)), "CDI additional GID not present in OCI spec")
++}
++
+ // TestTmpfsDevShmNoDupMount checks that a user-specified /dev/shm tmpfs
+ // mount (as in "docker run --tmpfs /dev/shm:rw,size=NNN") does not result
+ // in "Duplicate mount point" error from the engine.
diff --git a/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
new file mode 100644
index 00000000..8c5c5102
--- /dev/null
+++ b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
@@ -0,0 +1,61 @@
+From 6a21aad6ca4fd964672fbf54dd409650a1e05110 Mon Sep 17 00:00:00 2001
+From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+Date: Fri, 30 Oct 2026 09:02:24 +0200
+Subject: [PATCH] daemon: preserve OCI additionalGids for exec processes
+
+docker exec rebuilds user credentials using WithUser() and
+WithAdditionalGIDs(), which causes OCI Process.User.AdditionalGids
+defined during container creation to be lost.
+
+Preserve and merge the container's original AdditionalGids into the
+exec process specification so that supplemental groups injected by CDI
+or other OCI spec modifications remain available to exec sessions.
+
+Fixes a discrepancy where the container init process receives CDI
+additionalGids but processes started through docker exec do not.
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]
+
+Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+---
+ daemon/exec_linux.go | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/daemon/exec_linux.go b/daemon/exec_linux.go
+index 2d2f3d82f0999..014ab2f41c1b9 100644
+--- a/daemon/exec_linux.go
++++ b/daemon/exec_linux.go
+@@ -27,6 +27,11 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		return specs.User{}, err
+ 	}
+ 
++	// Preserve OCI additional groups from container creation.
++	inheritedGids := append(
++		[]uint32(nil),
++		spec.Process.User.AdditionalGids...,)
++
+ 	opts := []coci.SpecOpts{
+ 		coci.WithUser(ec.User),
+ 		coci.WithAdditionalGIDs(ec.User),
+@@ -38,6 +43,21 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		}
+ 	}
+ 
++	// Merge inherited OCI groups.
++	existing := map[uint32]struct{}{}
++
++	for _, gid := range spec.Process.User.AdditionalGids {
++		existing[gid] = struct{}{}
++	}
++
++	for _, gid := range inheritedGids {
++		if _, ok := existing[gid]; !ok {
++			spec.Process.User.AdditionalGids = append(
++				spec.Process.User.AdditionalGids,
++				gid,)
++		}
++	}
++
+ 	return spec.Process.User, nil
+ }
+ 
-- 
2.43.0

