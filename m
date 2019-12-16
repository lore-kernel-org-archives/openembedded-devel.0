Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0777E98A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:18:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k40so814791qtk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bBA15NsM654lT8J5TwmFJAiRYQqIgsk/+GTsrgipBVY=;
	b=pnYuwnfMU/yxvMzWdh7cWCsVVN8vunNU+tVGFcJoYRhlNLp7ADg2z31wVPAyoOtfT5
	InpQXEvaUM0BXRmvdUL7MJlQf+8xFp9qc1dwOLDsEn1R4T8+eOe7iU23p9SfsNdG91lF
	rAdabtzU/U/Pqo8VKW7g1kZiB19Z6xWVNn7rdSh6IxCo9tA1+Nz7QYlOFsqgClbbJCnU
	cee/pBz0pVWcTySnkuKJ/J4YJoN/kbholk9zAC62Y3cesHa9pvqpIEc7CfMXwb2uJBuy
	SuJH7BmrapaojcmI/3D6YVbv2GeUVr/vdqqomPZEm2+JnSJMTJptyUsOukyZid6UPHg6
	jjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bBA15NsM654lT8J5TwmFJAiRYQqIgsk/+GTsrgipBVY=;
	b=fk+In5xlCtLx4Bv9oTqoOrVhRypSbYetAi/AED2TCa0UbKIKFUs/cJCxm/4W0tDhi6
	3nIrv/lFN0g68uOlcnPthWVWR/43+bcqAk2d2mKxSJ00JB/Z5Jy8aA1YD603gJhy//UA
	/2rm/Q2CVD48lRNbSEZ14yGHtViMRYBzANu6KTrxpC/9f7E4y3mZC4PmzN5S7hZZZXUH
	1fKd8SvRQ7MmsW5Gi9rKuEu+gWr6TjBPJBBsyIcN/FIFtkm6bopDmyHlH17wsruVJFa5
	yr4f8ytgwH2IYbC29HNjSoBBpOBrxI2KG1G+InCbN0lHWIPWZrY70656l9a6ZHfeUJOp
	qqzA==
X-Gm-Message-State: APjAAAVQ57mvEMPyx8p8MELDj+GqP/Bi5C3QJ9M1/J14uXDXs2Y3bY4z
	4z81xEuGr/7Nkcrao8ssoOeiGiLrPWZL38eV1/pUCSy+
X-Google-Smtp-Source: APXvYqyEal67wyfLEn2VPHIlr2RwJi77SPB35ce/lRP2dgyVRK+rbT+rskjNO2c8NumPbhFI1xtQPjs2LZPQRX1R0Fs=
X-Received: by 2002:ac8:6ca:: with SMTP id j10mr19295298qth.378.1576462734503; 
	Sun, 15 Dec 2019 18:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20191213021342.8636-1-kai.kang@windriver.com>
	<20191213021342.8636-2-kai.kang@windriver.com>
	<CAMKF1sp9N4_KXHLqs=Nu29rO2a4dUfYPxjsUbsCV337OUSpzbA@mail.gmail.com>
	<1f1610ff-c494-2a86-a0d3-1fd5c23fd552@windriver.com>
In-Reply-To: <1f1610ff-c494-2a86-a0d3-1fd5c23fd552@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 18:18:43 -0800
Message-ID: <CAMKF1srS8CL2NvTbdqKZ+biuDirRJFMB9nfKtcqkSXgxVEW+7A@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/2] rdma-core: 18.1 -> 26.1
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
X-List-Received-Date: Mon, 16 Dec 2019 02:18:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

no worries

On Sun, Dec 15, 2019 at 6:05 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/12/13 =E4=B8=8B=E5=8D=887:02, Khem Raj wrote:
> > The latest is 0.27 is it possible to work that out
> > https://github.com/linux-rdma/rdma-core/releases/tag/v27.0
>
> It seems just released after I checked the release page. I'll upgrade it.
>
> Regards,
> Kai
>
>
> >
> > On Thu, Dec 12, 2019 at 6:14 PM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Upgrade rdma-core from 18.1 to 26.1.
> >>
> >> * remove patches which are merged by upstream
> >> * update context and remove more unbuildable manual in
> >>    0001-Remove-man-files-which-cant-be-built.patch
> >> * set services file for systemd
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   ...Remove-man-files-which-cant-be-built.patch | 255 ++++++++++++++++=
+-
> >>   ...IFSOCK-is-defined-in-both-glibc-musl.patch |  29 --
> >>   ...ude-endian.h-for-htole32-and-friends.patch |  25 --
> >>   ...Remove-unused-include-for-execinfo.h.patch |  27 --
> >>   ...igh.c-Do-not-include-net-if_packet.h.patch |  26 --
> >>   .../{rdma-core_18.1.bb =3D> rdma-core_26.1.bb}  |  26 +-
> >>   6 files changed, 261 insertions(+), 127 deletions(-)
> >>   delete mode 100644
> meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defi=
ned-in-both-glibc-musl.patch
> >>   delete mode 100644
> meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h=
-for-htole32-and-friends.patch
> >>   delete mode 100644
> meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-in=
clude-for-execinfo.h.patch
> >>   delete mode 100644
> meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-i=
nclude-net-if_packet.h.patch
> >>   rename meta-networking/recipes-support/rdma-core/{rdma-core_18.1.bb
> =3D> rdma-core_26.1.bb} (54%)
> >>
> >> diff --git
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-fil=
es-which-cant-be-built.patch
> b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-fil=
es-which-cant-be-built.patch
> >> index 4b595613f..f1437a0fb 100644
> >> ---
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-fil=
es-which-cant-be-built.patch
> >> +++
> b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-fil=
es-which-cant-be-built.patch
> >> @@ -14,14 +14,67 @@ Fixes errors
> >>   |   cmake_install.cmake:48 (include)
> >>
> >>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +
> >> +Update for version 26.1. Remove more man files which can no be built.
> >> +
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>   ---
> >> - libibumad/man/CMakeLists.txt      |  1 -
> >> - libibverbs/man/CMakeLists.txt     | 15 ---------------
> >> - providers/mlx5/man/CMakeLists.txt |  1 -
> >> - 3 files changed, 17 deletions(-)
> >> + infiniband-diags/man/CMakeLists.txt | 34 -------------------
> >> + libibumad/man/CMakeLists.txt        |  2 --
> >> + libibverbs/man/CMakeLists.txt       | 52 ---------------------------=
--
> >> + librdmacm/man/CMakeLists.txt        |  2 --
> >> + providers/efa/man/CMakeLists.txt    |  2 --
> >> + providers/mlx4/man/CMakeLists.txt   |  1 -
> >> + providers/mlx5/man/CMakeLists.txt   | 65
> -------------------------------------
> >> + 7 files changed, 158 deletions(-)
> >>
> >> +diff --git a/infiniband-diags/man/CMakeLists.txt
> b/infiniband-diags/man/CMakeLists.txt
> >> +index 1f1f91c9..094a389f 100644
> >> +--- a/infiniband-diags/man/CMakeLists.txt
> >> ++++ b/infiniband-diags/man/CMakeLists.txt
> >> +@@ -46,40 +46,6 @@ rdma_rst_common(
> >> + )
> >> +
> >> + rdma_man_pages(
> >> +-  check_lft_balance.8.in.rst
> >> +-  dump_fts.8.in.rst
> >> +-  ibaddr.8.in.rst
> >> +-  ibcacheedit.8.in.rst
> >> +-  ibccconfig.8.in.rst
> >> +-  ibccquery.8.in.rst
> >> +-  ibfindnodesusing.8.in.rst
> >> +-  ibhosts.8.in.rst
> >> +-  ibidsverify.8.in.rst
> >> +-  iblinkinfo.8.in.rst
> >> +-  ibnetdiscover.8.in.rst
> >> +-  ibnodes.8.in.rst
> >> +-  ibping.8.in.rst
> >> +-  ibportstate.8.in.rst
> >> +-  ibqueryerrors.8.in.rst
> >> +-  ibroute.8.in.rst
> >> +-  ibrouters.8.in.rst
> >> +-  ibstat.8.in.rst
> >> +-  ibstatus.8.in.rst
> >> +-  ibswitches.8.in.rst
> >> +-  ibsysstat.8.in.rst
> >> +-  ibtracert.8.in.rst
> >> +-  infiniband-diags.8.in.rst
> >> +-  perfquery.8.in.rst
> >> +-  saquery.8.in.rst
> >> +-  sminfo.8.in.rst
> >> +-  smpdump.8.in.rst
> >> +-  smpquery.8.in.rst
> >> +-  vendstat.8.in.rst
> >> +-  )
> >> +-
> >> +-rdma_alias_man_pages(
> >> +-  dump_fts.8 dump_lfts.8
> >> +-  dump_fts.8 dump_mfts.8
> >> +   )
> >> +
> >> + if (ENABLE_IBDIAGS_COMPAT)
> >>   diff --git a/libibumad/man/CMakeLists.txt
> b/libibumad/man/CMakeLists.txt
> >> -index 185584a0..ac45a4e9 100644
> >> +index 185584a0..857a4b8b 100644
> >>   --- a/libibumad/man/CMakeLists.txt
> >>   +++ b/libibumad/man/CMakeLists.txt
> >>   @@ -15,7 +15,6 @@ rdma_man_pages(
> >> @@ -32,19 +85,34 @@ index 185584a0..ac45a4e9 100644
> >>      umad_open_port.3
> >>      umad_poll.3
> >>      umad_recv.3
> >> +@@ -38,5 +37,4 @@ rdma_alias_man_pages(
> >> +   umad_class_str.3 umad_method_str.3
> >> +   umad_get_ca.3 umad_release_ca.3
> >> +   umad_get_port.3 umad_release_port.3
> >> +-  umad_init.3 umad_done.3
> >> +   )
> >>   diff --git a/libibverbs/man/CMakeLists.txt
> b/libibverbs/man/CMakeLists.txt
> >> -index 86dd49de..b54675be 100644
> >> +index e1d5edf8..92c68611 100644
> >>   --- a/libibverbs/man/CMakeLists.txt
> >>   +++ b/libibverbs/man/CMakeLists.txt
> >> -@@ -5,7 +5,6 @@ rdma_man_pages(
> >> +@@ -1,24 +1,18 @@
> >> + rdma_man_pages(
> >> +-  ibv_advise_mr.3.md
> >> +   ibv_alloc_dm.3
> >> +   ibv_alloc_mw.3
> >> +-  ibv_alloc_null_mr.3.md
> >> +   ibv_alloc_parent_domain.3
> >>      ibv_alloc_pd.3
> >>      ibv_alloc_td.3
> >>      ibv_asyncwatch.1
> >> +-  ibv_attach_counters_point_flow.3.md
> >>   -  ibv_attach_mcast.3.md
> >>      ibv_bind_mw.3
> >>      ibv_create_ah.3
> >>      ibv_create_ah_from_wc.3
> >> -@@ -14,7 +13,6 @@ rdma_man_pages(
> >> +   ibv_create_comp_channel.3
> >> +-  ibv_create_counters.3.md
> >> +   ibv_create_cq.3
> >>      ibv_create_cq_ex.3
> >>      ibv_modify_cq.3
> >>      ibv_create_flow.3
> >> @@ -52,7 +120,7 @@ index 86dd49de..b54675be 100644
> >>      ibv_create_qp.3
> >>      ibv_create_qp_ex.3
> >>      ibv_create_rwq_ind_table.3
> >> -@@ -23,15 +21,9 @@ rdma_man_pages(
> >> +@@ -27,16 +21,8 @@ rdma_man_pages(
> >>      ibv_create_wq.3
> >>      ibv_devices.1
> >>      ibv_devinfo.1
> >> @@ -61,14 +129,15 @@ index 86dd49de..b54675be 100644
> >>      ibv_get_async_event.3
> >>      ibv_get_cq_event.3
> >>   -  ibv_get_device_guid.3.md
> >> -   ibv_get_device_list.3
> >> +-  ibv_get_device_list.3.md
> >>   -  ibv_get_device_name.3.md
> >> +-  ibv_get_pkey_index.3.md
> >>   -  ibv_get_srq_num.3.md
> >>   -  ibv_inc_rkey.3.md
> >>      ibv_modify_qp.3
> >>      ibv_modify_qp_rate_limit.3
> >>      ibv_modify_srq.3
> >> -@@ -46,19 +38,12 @@ rdma_man_pages(
> >> +@@ -51,24 +37,15 @@ rdma_man_pages(
> >>      ibv_post_srq_recv.3
> >>      ibv_query_device.3
> >>      ibv_query_device_ex.3
> >> @@ -81,6 +150,7 @@ index 86dd49de..b54675be 100644
> >>   -  ibv_rate_to_mbps.3.md
> >>   -  ibv_rate_to_mult.3.md
> >>      ibv_rc_pingpong.1
> >> +-  ibv_read_counters.3.md
> >>      ibv_reg_mr.3
> >>   -  ibv_req_notify_cq.3.md
> >>   -  ibv_rereg_mr.3.md
> >> @@ -88,16 +158,175 @@ index 86dd49de..b54675be 100644
> >>      ibv_srq_pingpong.1
> >>      ibv_uc_pingpong.1
> >>      ibv_ud_pingpong.1
> >> +-  ibv_wr_post.3.md
> >> +   ibv_xsrq_pingpong.1
> >> +   )
> >> + rdma_alias_man_pages(
> >> +@@ -79,47 +56,18 @@ rdma_alias_man_pages(
> >> +   ibv_alloc_mw.3 ibv_dealloc_mw.3
> >> +   ibv_alloc_pd.3 ibv_dealloc_pd.3
> >> +   ibv_alloc_td.3 ibv_dealloc_td.3
> >> +-  ibv_attach_mcast.3 ibv_detach_mcast.3
> >> +   ibv_create_ah.3 ibv_destroy_ah.3
> >> +   ibv_create_ah_from_wc.3 ibv_init_ah_from_wc.3
> >> +   ibv_create_comp_channel.3 ibv_destroy_comp_channel.3
> >> +-  ibv_create_counters.3 ibv_destroy_counters.3
> >> +   ibv_create_cq.3 ibv_destroy_cq.3
> >> +   ibv_create_flow.3 ibv_destroy_flow.3
> >> +-  ibv_create_flow_action.3 ibv_destroy_flow_action.3
> >> +-  ibv_create_flow_action.3 ibv_modify_flow_action.3
> >> +   ibv_create_qp.3 ibv_destroy_qp.3
> >> +   ibv_create_rwq_ind_table.3 ibv_destroy_rwq_ind_table.3
> >> +   ibv_create_srq.3 ibv_destroy_srq.3
> >> +   ibv_create_wq.3 ibv_destroy_wq.3
> >> +-  ibv_event_type_str.3 ibv_node_type_str.3
> >> +-  ibv_event_type_str.3 ibv_port_state_str.3
> >> +   ibv_get_async_event.3 ibv_ack_async_event.3
> >> +   ibv_get_cq_event.3 ibv_ack_cq_events.3
> >> +-  ibv_get_device_list.3 ibv_free_device_list.3
> >> +   ibv_open_device.3 ibv_close_device.3
> >> +   ibv_open_xrcd.3 ibv_close_xrcd.3
> >> +-  ibv_rate_to_mbps.3 mbps_to_ibv_rate.3
> >> +-  ibv_rate_to_mult.3 mult_to_ibv_rate.3
> >> +   ibv_reg_mr.3 ibv_dereg_mr.3
> >> +-  ibv_wr_post.3 ibv_wr_abort.3
> >> +-  ibv_wr_post.3 ibv_wr_complete.3
> >> +-  ibv_wr_post.3 ibv_wr_start.3
> >> +-  ibv_wr_post.3 ibv_wr_atomic_cmp_swp.3
> >> +-  ibv_wr_post.3 ibv_wr_atomic_fetch_add.3
> >> +-  ibv_wr_post.3 ibv_wr_bind_mw.3
> >> +-  ibv_wr_post.3 ibv_wr_local_inv.3
> >> +-  ibv_wr_post.3 ibv_wr_rdma_read.3
> >> +-  ibv_wr_post.3 ibv_wr_rdma_write.3
> >> +-  ibv_wr_post.3 ibv_wr_rdma_write_imm.3
> >> +-  ibv_wr_post.3 ibv_wr_send.3
> >> +-  ibv_wr_post.3 ibv_wr_send_imm.3
> >> +-  ibv_wr_post.3 ibv_wr_send_inv.3
> >> +-  ibv_wr_post.3 ibv_wr_send_tso.3
> >> +-  ibv_wr_post.3 ibv_wr_set_inline_data.3
> >> +-  ibv_wr_post.3 ibv_wr_set_inline_data_list.3
> >> +-  ibv_wr_post.3 ibv_wr_set_sge.3
> >> +-  ibv_wr_post.3 ibv_wr_set_sge_list.3
> >> +-  ibv_wr_post.3 ibv_wr_set_ud_addr.3
> >> +-  ibv_wr_post.3 ibv_wr_set_xrc_srqn.3
> >> +   )
> >> +diff --git a/librdmacm/man/CMakeLists.txt
> b/librdmacm/man/CMakeLists.txt
> >> +index 2d1efbff..d016c926 100644
> >> +--- a/librdmacm/man/CMakeLists.txt
> >> ++++ b/librdmacm/man/CMakeLists.txt
> >> +@@ -20,7 +20,6 @@ rdma_man_pages(
> >> +   rdma_destroy_qp.3
> >> +   rdma_destroy_srq.3
> >> +   rdma_disconnect.3
> >> +-  rdma_establish.3.md
> >> +   rdma_event_str.3
> >> +   rdma_free_devices.3
> >> +   rdma_get_cm_event.3
> >> +@@ -33,7 +32,6 @@ rdma_man_pages(
> >> +   rdma_get_send_comp.3
> >> +   rdma_get_src_port.3
> >> +   rdma_getaddrinfo.3
> >> +-  rdma_init_qp_attr.3.md
> >> +   rdma_join_multicast.3
> >> +   rdma_join_multicast_ex.3
> >> +   rdma_leave_multicast.3
> >> +diff --git a/providers/efa/man/CMakeLists.txt
> b/providers/efa/man/CMakeLists.txt
> >> +index d6a4f57b..376f293d 100644
> >> +--- a/providers/efa/man/CMakeLists.txt
> >> ++++ b/providers/efa/man/CMakeLists.txt
> >> +@@ -1,4 +1,2 @@
> >> + rdma_man_pages(
> >> +-  efadv_create_driver_qp.3.md
> >> +-  efadv.7.md
> >> + )
> >> +diff --git a/providers/mlx4/man/CMakeLists.txt
> b/providers/mlx4/man/CMakeLists.txt
> >> +index 3df77caf..99a75101 100644
> >> +--- a/providers/mlx4/man/CMakeLists.txt
> >> ++++ b/providers/mlx4/man/CMakeLists.txt
> >> +@@ -1,6 +1,5 @@
> >> + rdma_man_pages(
> >> +   mlx4dv_init_obj.3
> >> +   mlx4dv_query_device.3
> >> +-  mlx4dv_set_context_attr.3.md
> >> +   mlx4dv.7
> >> + )
> >>   diff --git a/providers/mlx5/man/CMakeLists.txt
> b/providers/mlx5/man/CMakeLists.txt
> >> -index cdc7115e..876b6fcf 100644
> >> +index 0bd9eba1..876b6fcf 100644
> >>   --- a/providers/mlx5/man/CMakeLists.txt
> >>   +++ b/providers/mlx5/man/CMakeLists.txt
> >> -@@ -1,5 +1,4 @@
> >> +@@ -1,72 +1,7 @@
> >>    rdma_man_pages(
> >> +-  mlx5dv_alloc_dm.3.md
> >> +-  mlx5dv_create_cq.3.md
> >> +-  mlx5dv_create_flow.3.md
> >> +-  mlx5dv_create_flow_action_modify_header.3.md
> >> +-  mlx5dv_create_flow_action_packet_reformat.3.md
> >> +-  mlx5dv_create_flow_matcher.3.md
> >> +-  mlx5dv_create_mkey.3.md
> >> +-  mlx5dv_create_qp.3.md
> >> +-  mlx5dv_devx_alloc_uar.3.md
> >> +-  mlx5dv_devx_create_cmd_comp.3.md
> >> +-  mlx5dv_devx_create_event_channel.3.md
> >> +-  mlx5dv_devx_get_event.3.md
> >> +-  mlx5dv_devx_obj_create.3.md
> >> +-  mlx5dv_devx_qp_modify.3.md
> >> +-  mlx5dv_devx_query_eqn.3.md
> >> +-  mlx5dv_devx_subscribe_devx_event.3.md
> >> +-  mlx5dv_devx_umem_reg.3.md
> >> +-  mlx5dv_dr_flow.3.md
> >>   -  mlx5dv_flow_action_esp.3.md
> >>      mlx5dv_get_clock_info.3
> >>      mlx5dv_init_obj.3
> >> +-  mlx5dv_is_supported.3.md
> >> +-  mlx5dv_open_device.3.md
> >>      mlx5dv_query_device.3
> >> +   mlx5dv_ts_to_ns.3
> >> +-  mlx5dv_wr_post.3.md
> >> +   mlx5dv.7
> >> + )
> >> +-rdma_alias_man_pages(
> >> +- mlx5dv_create_mkey.3 mlx5dv_destroy_mkey.3
> >> +- mlx5dv_devx_alloc_uar.3 mlx5dv_devx_free_uar.3
> >> +- mlx5dv_devx_create_cmd_comp.3 mlx5dv_devx_destroy_cmd_comp.3
> >> +- mlx5dv_devx_create_event_channel.3
> mlx5dv_devx_destroy_event_channel.3
> >> +- mlx5dv_devx_create_cmd_comp.3 mlx5dv_devx_get_async_cmd_comp.3
> >> +- mlx5dv_devx_obj_create.3 mlx5dv_devx_general_cmd.3
> >> +- mlx5dv_devx_obj_create.3 mlx5dv_devx_obj_destroy.3
> >> +- mlx5dv_devx_obj_create.3 mlx5dv_devx_obj_query.3
> >> +- mlx5dv_devx_obj_create.3 mlx5dv_devx_obj_query_async.3
> >> +- mlx5dv_devx_obj_create.3 mlx5dv_devx_obj_modify.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_qp_query.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_cq_modify.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_cq_query.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_wq_modify.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_wq_query.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_srq_modify.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_srq_query.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_ind_tbl_modify.3
> >> +- mlx5dv_devx_qp_modify.3 mlx5dv_devx_ind_tbl_query.3
> >> +- mlx5dv_devx_subscribe_devx_event.3
> mlx5dv_devx_subscribe_devx_event_fd.3
> >> +- mlx5dv_devx_umem_reg.3 mlx5dv_devx_umem_dereg.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_dest_table.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_dest_ibv_qp.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_dest_vport.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_flow_counter.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_drop.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_modify_header.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_packet_reformat.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_tag.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_action_destroy.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_domain_create.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_domain_destroy.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_domain_sync.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_matcher_create.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_matcher_destroy.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_rule_create.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_rule_destroy.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_table_create.3
> >> +- mlx5dv_dr_flow.3 mlx5dv_dr_table_destroy.3
> >> +- mlx5dv_wr_post.3 mlx5dv_wr_set_dc_addr.3
> >> +- mlx5dv_wr_post.3 mlx5dv_qp_ex_from_ibv_qp_ex.3
> >> +-)
> >>   --
> >>   2.17.1
> >>
> >> diff --git
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-de=
fined-in-both-glibc-musl.patch
> b/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-de=
fined-in-both-glibc-musl.patch
> >> deleted file mode 100644
> >> index b04c9b723..000000000
> >> ---
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-de=
fined-in-both-glibc-musl.patch
> >> +++ /dev/null
> >> @@ -1,29 +0,0 @@
> >> -From f2df1db11f3a9580774300e703b6f53dbcdb28ef Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Fri, 8 Jun 2018 20:17:57 -0700
> >> -Subject: [PATCH] S_IFSOCK is defined in both glibc/musl
> >> -
> >> -Fixes
> >> -
> >> -preload.c:1183:46: error: '__S_IFSOCK' undeclared (first use in this
> function); did you mean 'S_IFSOCK'?
> >> -
> >> -Upstream-Status: Pending
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - librdmacm/preload.c | 2 +-
> >> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> -
> >> -diff --git a/librdmacm/preload.c b/librdmacm/preload.c
> >> -index 0f2aa250..d46beb1b 100644
> >> ---- a/librdmacm/preload.c
> >> -+++ b/librdmacm/preload.c
> >> -@@ -1180,7 +1180,7 @@ int __fxstat(int ver, int socket, struct stat
> *buf)
> >> -       if (fd_get(socket, &fd) =3D=3D fd_rsocket) {
> >> -               ret =3D real.fxstat(ver, socket, buf);
> >> -               if (!ret)
> >> --                      buf->st_mode =3D (buf->st_mode & ~S_IFMT) |
> __S_IFSOCK;
> >> -+                      buf->st_mode =3D (buf->st_mode & ~S_IFMT) |
> S_IFSOCK;
> >> -       } else {
> >> -               ret =3D real.fxstat(ver, fd, buf);
> >> -       }
> >> diff --git
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian=
.h-for-htole32-and-friends.patch
> b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian=
.h-for-htole32-and-friends.patch
> >> deleted file mode 100644
> >> index aa335244b..000000000
> >> ---
> a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian=
.h-for-htole32-and-friends.patch
> >> +++ /dev/null
> >> @@ -1,25 +0,0 @@
> >> -From 65b9a47c07be4611b4fbbcafff1993186bcb0537 Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Tue, 12 Jun 2018 19:15:52 -0700
> >> -Subject: [PATCH 1/2] include endian.h for htole32 and friends
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - providers/hns/hns_roce_u.h | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/providers/hns/hns_roce_u.h b/providers/hns/hns_roce_u.h
> >> -index bd66c6e7..b07424db 100644
> >> ---- a/providers/hns/hns_roce_u.h
> >> -+++ b/providers/hns/hns_roce_u.h
> >> -@@ -34,6 +34,7 @@
> >> - #define _HNS_ROCE_U_H
> >> -
> >> - #include <stddef.h>
> >> -+#include <endian.h>
> >> - #include <util/compiler.h>
> >> -
> >> - #include <infiniband/driver.h>
> >> ---
> >> -2.17.1
> >> -
> >> diff --git
> a/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-=
include-for-execinfo.h.patch
> b/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-=
include-for-execinfo.h.patch
> >> deleted file mode 100644
> >> index 347f964e9..000000000
> >> ---
> a/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-=
include-for-execinfo.h.patch
> >> +++ /dev/null
> >> @@ -1,27 +0,0 @@
> >> -From 3d9cae15c69c0b3260a024ad5d6802a8d85515a2 Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Tue, 12 Jun 2018 19:18:24 -0700
> >> -Subject: [PATCH 2/2] Remove unused include for execinfo.h
> >> -
> >> -Fixes build on musl
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - providers/qedr/qelr_verbs.c | 1 -
> >> - 1 file changed, 1 deletion(-)
> >> -
> >> -diff --git a/providers/qedr/qelr_verbs.c b/providers/qedr/qelr_verbs.=
c
> >> -index e3b01f28..2ee1c832 100644
> >> ---- a/providers/qedr/qelr_verbs.c
> >> -+++ b/providers/qedr/qelr_verbs.c
> >> -@@ -54,7 +54,6 @@
> >> -
> >> - #include <stdio.h>
> >> - #include <stdlib.h>
> >> --#include <execinfo.h>
> >> -
> >> - #define QELR_SQE_ELEMENT_SIZE (sizeof(struct rdma_sq_sge))
> >> - #define QELR_RQE_ELEMENT_SIZE (sizeof(struct rdma_rq_sge))
> >> ---
> >> -2.17.1
> >> -
> >> diff --git
> a/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not=
-include-net-if_packet.h.patch
> b/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not=
-include-net-if_packet.h.patch
> >> deleted file mode 100644
> >> index e887f222b..000000000
> >> ---
> a/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not=
-include-net-if_packet.h.patch
> >> +++ /dev/null
> >> @@ -1,26 +0,0 @@
> >> -From 82486f7e1ee2aa07a5c12cb357834993aa8c1d20 Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Fri, 8 Jun 2018 20:19:13 -0700
> >> -Subject: [PATCH] neigh.c: Do not include net/if_packet.h
> >> -
> >> -This header is glibc specific
> >> -
> >> -Upstream-Status: Pending
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - libibverbs/neigh.c | 1 -
> >> - 1 file changed, 1 deletion(-)
> >> -
> >> -diff --git a/libibverbs/neigh.c b/libibverbs/neigh.c
> >> -index 21177db0..cfc593a0 100644
> >> ---- a/libibverbs/neigh.c
> >> -+++ b/libibverbs/neigh.c
> >> -@@ -2,7 +2,6 @@
> >> -  */
> >> -
> >> - #include "config.h"
> >> --#include <net/if_packet.h>
> >> - #include <linux/netlink.h>
> >> - #include <linux/rtnetlink.h>
> >> - #include <endian.h>
> >> diff --git a/meta-networking/recipes-support/rdma-core/
> rdma-core_18.1.bb b/meta-networking/recipes-support/rdma-core/
> rdma-core_26.1.bb
> >> similarity index 54%
> >> rename from meta-networking/recipes-support/rdma-core/rdma-core_18.1.b=
b
> >> rename to meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb
> >> index 6ad864d1e..1afe496c5 100644
> >> --- a/meta-networking/recipes-support/rdma-core/rdma-core_18.1.bb
> >> +++ b/meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb
> >> @@ -5,14 +5,11 @@ SECTION =3D "libs"
> >>   DEPENDS =3D "libnl"
> >>   RDEPENDS_${PN} =3D "bash perl"
> >>
> >> -SRC_URI =3D "git://github.com/linux-rdma/rdma-core.git;branch=3Dstabl=
e-v18
> \
> >> -           file://0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch \
> >> -           file://0002-neigh.c-Do-not-include-net-if_packet.h.patch \
> >> -           file://0001-include-endian.h-for-htole32-and-friends.patch=
 \
> >> -           file://0002-Remove-unused-include-for-execinfo.h.patch \
> >> +BRANCH =3D "stable-v${@d.getVar('PV').split('.')[0]}"
> >> +SRC_URI =3D "git://github.com/linux-rdma/rdma-core.git;branch=3D${BRA=
NCH}
> <http://github.com/linux-rdma/rdma-core.git;branch=3D$%7BBRANCH%7D> \
> >>              file://0001-Remove-man-files-which-cant-be-built.patch \
> >>              "
> >> -SRCREV =3D "7844b3fbe5120623d63b29ecb43eb83a61129658"
> >> +SRCREV =3D "9f820de9ca7d6e315be92bc830d354afad3e7960"
> >>   S =3D "${WORKDIR}/git"
> >>
> >>   #Default Dual License
> https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
> >> @@ -20,11 +17,26 @@ LICENSE =3D "BSD-2-Clause | GPLv2"
> >>   LIC_FILES_CHKSUM =3D
> "file://COPYING.BSD_FB;md5=3D0ec18bae1a9df92c8d6ae01f94a289ae \
> >>
>  file://COPYING.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >>
> >> +EXTRA_OECMAKE =3D " \
> >> +    -DCMAKE_INSTALL_SYSTEMD_SERVICEDIR=3D${systemd_system_unitdir} \
> >> +    -DCMAKE_INSTALL_PERLDIR=3D${libdir}/perl5/${@get_perl_version(d)}=
 \
> >> +"
> >>
> >>   FILES_SOLIBSDEV =3D ""
> >>   FILES_${PN} +=3D "${libdir}/*"
> >>   INSANE_SKIP_${PN} +=3D "dev-so"
> >>
> >> -inherit cmake
> >> +inherit cmake cpan-base systemd
> >> +
> >> +SYSTEMD_SERVICE_${PN} =3D " \
> >> +    srp_daemon.service \
> >> +    iwpmd.service \
> >> +    ibacm.socket \
> >> +    rdma-load-modules@.service \
> >> +    srp_daemon_port@.service \
> >> +    rdma-hw.target \
> >> +    ibacm.service \
> >> +"
> >> +SYSTEMD_AUTO_ENABLE =3D "disable"
> >>
> >>   OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> Kai Kang
>
>

