Return-Path: <Isaac.Hermida@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.201])
	by mail.openembedded.org (Postfix) with ESMTP id 3031665CB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Nov 2017 09:27:47 +0000 (UTC)
Received: from [216.82.242.35] by server-9.bemta-8.messagelabs.com id
	C3/D4-02047-59C710A5; Tue, 07 Nov 2017 09:27:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRWlGSWpSXmKPExsXi5LtOQHdSDWO
	Uwf1txhZ7Py1itLh4eCmzA5PHzll32T3ObVzBGMAUxZqZl5RfkcCa0XP/JHNBxwymimUNL1ka
	GC89Z+xi5OIQEljFKHGxv4UZwlnNKHFmfi8LhLOYUeLg9utADicHm4C+xM03t9hBEiICPYwSS
	zZ/YwZJCAuESNyZ8pIJxBYRCJXY/3oFaxcjB5CtJ3H/iypImEVARaKx8zcbiM0roC4xbftWMF
	tIwE1iz+R+RhCbU8BdYtnpZ2BjGAXEJL6fWgNmMwuIS9x6Mh/MlhAQkFiy5zwzhC0q8fLxP7B
	VogLhEqs7zCHCChJHJ61jg2g1kHh/bj4zhG0u8fv/eyhbW2LZwtfMEOcISpyc+YQF4hxlidPv
	tzNOYBSfhWTzLCSjZiEZNQvJqFlIRi1gZF3FqFGcWlSWWqRrZKKXVJSZnlGSm5iZo2toYKGXm
	1pcnJiempOYVKyXnJ+7iREYkfUMDIw7GM++jjzEKMnBpCTKuyGEIUqILyk/pTIjsTgjvqg0J7
	X4EKMMB4eSBG9BNWOUkGBRanpqRVpmDjA1wKQlOHiURHiDQNK8xQWJucWZ6RCpU4y6HM9mvm5
	gFmLJy89LlRLn3QBSJABSlFGaBzcClqYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQQy
	hSczrwRu0yugI5iAjtgPcj9vcUkiQkqqgTG64WhgrkbmrKzS2/0su2ZIceXNOLOzbxIjy8Jji
	z9bTvpsPUXthmoFh8W1te5chsfyC0SPne+Nn2XXu2mrqb2Pq2a9mdD3TZ/8X0z+1eVx/8uWu1
	/6D0tHzd0kdztv1v1/zdusD6/cO+9NoE3OqnU67tmnXi0Pu9kg5Xql+clljmaDCumHnk+VWIo
	zEg21mIuKEwHBov3iTgMAAA==
X-Env-Sender: Isaac.Hermida@digi.com
X-Msg-Ref: server-10.tower-75.messagelabs.com!1510046866!49361886!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14160 invoked from network); 7 Nov 2017 09:27:46 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-10.tower-75.messagelabs.com with SMTP;
	7 Nov 2017 09:27:46 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 7 Nov 2017 03:27:43 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 7 Nov 2017 03:27:43 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Tue, 7 Nov 2017 10:27:41 +0100
From: "Hermida, Isaac" <Isaac.Hermida@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [oe] [meta-oe][morty][PATCH] hostapd: fix WPA2 key replay
	security bug
Thread-Index: AQHTV6qoo0QUXQnuc0qIKzw0zi67FQ==
Date: Tue, 7 Nov 2017 09:27:40 +0000
Message-ID: <5A017C8B.4040209@digi.com>
References: <1509627530-31077-1-git-send-email-isaac.hermida@digi.com>
In-Reply-To: <1509627530-31077-1-git-send-email-isaac.hermida@digi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
x-originating-ip: [10.101.2.100]
MIME-Version: 1.0
Subject: Re: [meta-oe][morty][PATCH] hostapd: fix WPA2 key replay security bug
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
X-List-Received-Date: Tue, 07 Nov 2017 09:27:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <68224138E769D74F827B26750E556ED0@digi.com>
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Do you plan to merge this into morty? Or is there a similar patch (maybe=20
I skip it in the list)?
I would like to know if it is going to be merged shortly (or rejected).

Thanks,


On 11/02/2017 01:58 PM, Isaac Hermida wrote:
> Note, hostapd and wpa_supplicant use the same sources. This commit uses t=
he same
> patch than OpenEmbedded-core commit 1d92cb1a20135cfffff9f94a6633ec0840518=
738 in
> morty branch.
>
> Signed-off-by: Isaac Hermida <isaac.hermida@digi.com>
> ---
>   .../hostapd/hostapd/key-replay-cve-multiple.patch  | 939 ++++++++++++++=
+++++++
>   .../recipes-connectivity/hostapd/hostapd_2.5.bb    |   1 +
>   2 files changed, 940 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/key-rep=
lay-cve-multiple.patch
>
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cve-=
multiple.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cv=
e-multiple.patch
> new file mode 100644
> index 000000000000..32fad29cf63d
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cve-multipl=
e.patch
> @@ -0,0 +1,939 @@
> +The WPA2 four-way handshake protocol is vulnerable to replay attacks whi=
ch can
> +result in unauthenticated clients gaining access to the network.
> +
> +Backport a number of patches from upstream to fix this.
> +
> +CVE: CVE-2017-13077
> +CVE: CVE-2017-13078
> +CVE: CVE-2017-13079
> +CVE: CVE-2017-13080
> +CVE: CVE-2017-13081
> +CVE: CVE-2017-13082
> +CVE: CVE-2017-13086
> +CVE: CVE-2017-13087
> +CVE: CVE-2017-13088
> +
> +Thanks to Wind River for the backport from upstream master to wpa_suppli=
cant
> +2.5.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 9a4a0f78bb2ad516d4a295fb5d042f8a61bd3f47 Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 10:13:17 +0800
> +Subject: [PATCH 1/7] hostapd: Avoid key reinstallation in FT handshake
> +
> +Do not reinstall TK to the driver during Reassociation Response frame
> +processing if the first attempt of setting the TK succeeded. This avoids
> +issues related to clearing the TX/RX PN that could result in reusing
> +same PN values for transmitted frames (e.g., due to CCM nonce reuse and
> +also hitting replay protection on the receiver) and accepting replayed
> +frames on RX side.
> +
> +This issue was introduced by the commit
> +0e84c25434e6a1f283c7b4e62e483729085b78d2 ('FT: Fix PTK configuration in
> +authenticator') which allowed wpa_ft_install_ptk() to be called multiple
> +times with the same PTK. While the second configuration attempt is
> +needed with some drivers, it must be done only if the first attempt
> +failed.
> +
> +Signed-off-by: Mathy Vanhoef <Mathy.Vanhoef@cs.kuleuven.be>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/ap/wpa_auth.c    |  9 +++++++++
> + src/ap/wpa_auth.h    |  3 ++-
> + src/ap/wpa_auth_ft.c | 10 ++++++++++
> + src/ap/wpa_auth_i.h  |  1 +
> + 4 files changed, 22 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/ap/wpa_auth.c b/src/ap/wpa_auth.c
> +index 2760a3f..b38a64d 100644
> +--- a/src/ap/wpa_auth.c
> ++++ b/src/ap/wpa_auth.c
> +@@ -1740,6 +1740,9 @@ int wpa_auth_sm_event(struct wpa_state_machine *sm=
, enum wpa_event event)
> + #else /* CONFIG_IEEE80211R */
> + 		break;
> + #endif /* CONFIG_IEEE80211R */
> ++	case WPA_DRV_STA_REMOVED:
> ++		sm->tk_already_set =3D FALSE;
> ++		return 0;
> + 	}
> +
> + #ifdef CONFIG_IEEE80211R
> +@@ -3208,6 +3211,12 @@ int wpa_auth_sta_wpa_version(struct wpa_state_mac=
hine *sm)
> + 	return sm->wpa;
> + }
> +
> ++int wpa_auth_sta_ft_tk_already_set(struct wpa_state_machine *sm)
> ++{
> ++	if (!sm || !wpa_key_mgmt_ft(sm->wpa_key_mgmt))
> ++		return 0;
> ++	return sm->tk_already_set;
> ++}
> +
> + int wpa_auth_sta_clear_pmksa(struct wpa_state_machine *sm,
> + 			     struct rsn_pmksa_cache_entry *entry)
> +diff --git a/src/ap/wpa_auth.h b/src/ap/wpa_auth.h
> +index fd04f16..3e53461 100644
> +--- a/src/ap/wpa_auth.h
> ++++ b/src/ap/wpa_auth.h
> +@@ -258,7 +258,7 @@ void wpa_receive(struct wpa_authenticator *wpa_auth,
> + 		 u8 *data, size_t data_len);
> + enum wpa_event {
> + 	WPA_AUTH, WPA_ASSOC, WPA_DISASSOC, WPA_DEAUTH, WPA_REAUTH,
> +-	WPA_REAUTH_EAPOL, WPA_ASSOC_FT
> ++	WPA_REAUTH_EAPOL, WPA_ASSOC_FT, WPA_DRV_STA_REMOVED
> + };
> + void wpa_remove_ptk(struct wpa_state_machine *sm);
> + int wpa_auth_sm_event(struct wpa_state_machine *sm, enum wpa_event even=
t);
> +@@ -271,6 +271,7 @@ int wpa_auth_pairwise_set(struct wpa_state_machine *=
sm);
> + int wpa_auth_get_pairwise(struct wpa_state_machine *sm);
> + int wpa_auth_sta_key_mgmt(struct wpa_state_machine *sm);
> + int wpa_auth_sta_wpa_version(struct wpa_state_machine *sm);
> ++int wpa_auth_sta_ft_tk_already_set(struct wpa_state_machine *sm);
> + int wpa_auth_sta_clear_pmksa(struct wpa_state_machine *sm,
> + 			     struct rsn_pmksa_cache_entry *entry);
> + struct rsn_pmksa_cache_entry *
> +diff --git a/src/ap/wpa_auth_ft.c b/src/ap/wpa_auth_ft.c
> +index eeaffbf..f8f5dbe 100644
> +--- a/src/ap/wpa_auth_ft.c
> ++++ b/src/ap/wpa_auth_ft.c
> +@@ -780,6 +780,14 @@ void wpa_ft_install_ptk(struct wpa_state_machine *s=
m)
> + 		return;
> + 	}
> +
> ++	if (sm->tk_already_set) {
> ++		/* Must avoid TK reconfiguration to prevent clearing of TX/RX
> ++		 * PN in the driver */
> ++		wpa_printf(MSG_DEBUG,
> ++			   "FT: Do not re-install same PTK to the driver");
> ++		return;
> ++	}
> ++
> + 	/* FIX: add STA entry to kernel/driver here? The set_key will fail
> + 	 * most likely without this.. At the moment, STA entry is added only
> + 	 * after association has been completed. This function will be called
> +@@ -792,6 +800,7 @@ void wpa_ft_install_ptk(struct wpa_state_machine *sm=
)
> +
> + 	/* FIX: MLME-SetProtection.Request(TA, Tx_Rx) */
> + 	sm->pairwise_set =3D TRUE;
> ++	sm->tk_already_set =3D TRUE;
> + }
> +
> +
> +@@ -898,6 +907,7 @@ static int wpa_ft_process_auth_req(struct wpa_state_=
machine *sm,
> +
> + 	sm->pairwise =3D pairwise;
> + 	sm->PTK_valid =3D TRUE;
> ++	sm->tk_already_set =3D FALSE;
> + 	wpa_ft_install_ptk(sm);
> +
> + 	buflen =3D 2 + sizeof(struct rsn_mdie) + 2 + sizeof(struct rsn_ftie) +
> +diff --git a/src/ap/wpa_auth_i.h b/src/ap/wpa_auth_i.h
> +index 57b098f..234d84c 100644
> +--- a/src/ap/wpa_auth_i.h
> ++++ b/src/ap/wpa_auth_i.h
> +@@ -64,6 +64,7 @@ struct wpa_state_machine {
> + 	struct wpa_ptk PTK;
> + 	Boolean PTK_valid;
> + 	Boolean pairwise_set;
> ++	Boolean tk_already_set;
> + 	int keycount;
> + 	Boolean Pair;
> + 	struct wpa_key_replay_counter {
> +--
> +1.9.1
> +
> +From d0d1adad8792ae948743031543db8839f83db829 Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 13:18:59 +0800
> +Subject: [PATCH 2/7] Prevent reinstallation of an already in-use group k=
ey
> +
> +Track the current GTK and IGTK that is in use and when receiving a
> +(possibly retransmitted) Group Message 1 or WNM-Sleep Mode Response, do
> +not install the given key if it is already in use. This prevents an
> +attacker from trying to trick the client into resetting or lowering the
> +sequence counter associated to the group key.
> +
> +Signed-off-by: Mathy Vanhoef <Mathy.Vanhoef@cs.kuleuven.be>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/common/wpa_common.h |  11 +++++
> + src/rsn_supp/wpa.c      | 119 +++++++++++++++++++++++++++++------------=
-------
> + src/rsn_supp/wpa_i.h    |   4 ++
> + 3 files changed, 88 insertions(+), 46 deletions(-)
> +
> +diff --git a/src/common/wpa_common.h b/src/common/wpa_common.h
> +index c08f651..21e13da 100644
> +--- a/src/common/wpa_common.h
> ++++ b/src/common/wpa_common.h
> +@@ -215,6 +215,17 @@ struct wpa_ptk {
> + 	size_t tk_len;
> + };
> +
> ++struct wpa_gtk {
> ++	u8 gtk[WPA_GTK_MAX_LEN];
> ++	size_t gtk_len;
> ++};
> ++
> ++#ifdef CONFIG_IEEE80211W
> ++struct wpa_igtk {
> ++	u8 igtk[WPA_IGTK_MAX_LEN];
> ++	size_t igtk_len;
> ++};
> ++#endif /* CONFIG_IEEE80211W */
> +
> + /* WPA IE version 1
> +  * 00-50-f2:1 (OUI:OUI type)
> +diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
> +index a9f255e..eab7151 100644
> +--- a/src/rsn_supp/wpa.c
> ++++ b/src/rsn_supp/wpa.c
> +@@ -697,6 +697,15 @@ static int wpa_supplicant_install_gtk(struct wpa_sm=
 *sm,
> + 	const u8 *_gtk =3D gd->gtk;
> + 	u8 gtk_buf[32];
> +
> ++	/* Detect possible key reinstallation */
> ++	if (sm->gtk.gtk_len =3D=3D (size_t) gd->gtk_len &&
> ++	    os_memcmp(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len) =3D=3D 0) {
> ++		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> ++			"WPA: Not reinstalling already in-use GTK to the driver (keyidx=3D%d=
 tx=3D%d len=3D%d)",
> ++			gd->keyidx, gd->tx, gd->gtk_len);
> ++		return 0;
> ++	}
> ++
> + 	wpa_hexdump_key(MSG_DEBUG, "WPA: Group Key", gd->gtk, gd->gtk_len);
> + 	wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> + 		"WPA: Installing GTK to the driver (keyidx=3D%d tx=3D%d len=3D%d)",
> +@@ -731,6 +740,9 @@ static int wpa_supplicant_install_gtk(struct wpa_sm =
*sm,
> + 	}
> + 	os_memset(gtk_buf, 0, sizeof(gtk_buf));
> +
> ++	sm->gtk.gtk_len =3D gd->gtk_len;
> ++	os_memcpy(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len);
> ++
> + 	return 0;
> + }
> +
> +@@ -801,6 +813,47 @@ static int wpa_supplicant_pairwise_gtk(struct wpa_s=
m *sm,
> + 	return 0;
> + }
> +
> ++#ifdef CONFIG_IEEE80211W
> ++static int wpa_supplicant_install_igtk(struct wpa_sm *sm,
> ++				       const struct wpa_igtk_kde *igtk)
> ++{
> ++	size_t len =3D wpa_cipher_key_len(sm->mgmt_group_cipher);
> ++	u16 keyidx =3D WPA_GET_LE16(igtk->keyid);
> ++
> ++	/* Detect possible key reinstallation */
> ++	if (sm->igtk.igtk_len =3D=3D len &&
> ++	    os_memcmp(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len) =3D=3D 0) =
{
> ++		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> ++			"WPA: Not reinstalling already in-use IGTK to the driver (keyidx=3D%=
d)",
> ++			keyidx);
> ++		return  0;
> ++	}
> ++
> ++	wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> ++		"WPA: IGTK keyid %d pn %02x%02x%02x%02x%02x%02x",
> ++		keyidx, MAC2STR(igtk->pn));
> ++	wpa_hexdump_key(MSG_DEBUG, "WPA: IGTK", igtk->igtk, len);
> ++	if (keyidx > 4095) {
> ++		wpa_msg(sm->ctx->msg_ctx, MSG_WARNING,
> ++			"WPA: Invalid IGTK KeyID %d", keyidx);
> ++		return -1;
> ++	}
> ++	if (wpa_sm_set_key(sm, wpa_cipher_to_alg(sm->mgmt_group_cipher),
> ++			   broadcast_ether_addr,
> ++			   keyidx, 0, igtk->pn, sizeof(igtk->pn),
> ++			   igtk->igtk, len) < 0) {
> ++		wpa_msg(sm->ctx->msg_ctx, MSG_WARNING,
> ++			"WPA: Failed to configure IGTK to the driver");
> ++		return -1;
> ++	}
> ++
> ++	sm->igtk.igtk_len =3D len;
> ++	os_memcpy(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len);
> ++
> ++	return 0;
> ++}
> ++#endif /* CONFIG_IEEE80211W */
> ++
> +
> + static int ieee80211w_set_keys(struct wpa_sm *sm,
> + 			       struct wpa_eapol_ie_parse *ie)
> +@@ -812,30 +865,14 @@ static int ieee80211w_set_keys(struct wpa_sm *sm,
> + 	if (ie->igtk) {
> + 		size_t len;
> + 		const struct wpa_igtk_kde *igtk;
> +-		u16 keyidx;
> ++
> + 		len =3D wpa_cipher_key_len(sm->mgmt_group_cipher);
> + 		if (ie->igtk_len !=3D WPA_IGTK_KDE_PREFIX_LEN + len)
> + 			return -1;
> ++
> + 		igtk =3D (const struct wpa_igtk_kde *) ie->igtk;
> +-		keyidx =3D WPA_GET_LE16(igtk->keyid);
> +-		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG, "WPA: IGTK keyid %d "
> +-			"pn %02x%02x%02x%02x%02x%02x",
> +-			keyidx, MAC2STR(igtk->pn));
> +-		wpa_hexdump_key(MSG_DEBUG, "WPA: IGTK",
> +-				igtk->igtk, len);
> +-		if (keyidx > 4095) {
> +-			wpa_msg(sm->ctx->msg_ctx, MSG_WARNING,
> +-				"WPA: Invalid IGTK KeyID %d", keyidx);
> +-			return -1;
> +-		}
> +-		if (wpa_sm_set_key(sm, wpa_cipher_to_alg(sm->mgmt_group_cipher),
> +-				   broadcast_ether_addr,
> +-				   keyidx, 0, igtk->pn, sizeof(igtk->pn),
> +-				   igtk->igtk, len) < 0) {
> +-			wpa_msg(sm->ctx->msg_ctx, MSG_WARNING,
> +-				"WPA: Failed to configure IGTK to the driver");
> +-			return -1;
> +-		}
> ++		if (wpa_supplicant_install_igtk(sm, igtk) < 0)
> ++ 			return -1;
> + 	}
> +
> + 	return 0;
> +@@ -2251,7 +2288,7 @@ void wpa_sm_deinit(struct wpa_sm *sm)
> +  */
> + void wpa_sm_notify_assoc(struct wpa_sm *sm, const u8 *bssid)
> + {
> +-	int clear_ptk =3D 1;
> ++	int clear_keys =3D 1;
> +
> + 	if (sm =3D=3D NULL)
> + 		return;
> +@@ -2277,11 +2314,11 @@ void wpa_sm_notify_assoc(struct wpa_sm *sm, cons=
t u8 *bssid)
> + 		/* Prepare for the next transition */
> + 		wpa_ft_prepare_auth_request(sm, NULL);
> +
> +-		clear_ptk =3D 0;
> ++		clear_keys =3D 0;
> + 	}
> + #endif /* CONFIG_IEEE80211R */
> +
> +-	if (clear_ptk) {
> ++	if (clear_keys) {
> + 		/*
> + 		 * IEEE 802.11, 8.4.10: Delete PTK SA on (re)association if
> + 		 * this is not part of a Fast BSS Transition.
> +@@ -2291,6 +2328,10 @@ void wpa_sm_notify_assoc(struct wpa_sm *sm, const=
 u8 *bssid)
> + 		os_memset(&sm->ptk, 0, sizeof(sm->ptk));
> + 		sm->tptk_set =3D 0;
> + 		os_memset(&sm->tptk, 0, sizeof(sm->tptk));
> ++		os_memset(&sm->gtk, 0, sizeof(sm->gtk));
> ++#ifdef CONFIG_IEEE80211W
> ++		os_memset(&sm->igtk, 0, sizeof(sm->igtk));
> ++#endif /* CONFIG_IEEE80211W */
> + 	}
> +
> + #ifdef CONFIG_TDLS
> +@@ -2807,6 +2848,10 @@ void wpa_sm_drop_sa(struct wpa_sm *sm)
> + 	os_memset(sm->pmk, 0, sizeof(sm->pmk));
> + 	os_memset(&sm->ptk, 0, sizeof(sm->ptk));
> + 	os_memset(&sm->tptk, 0, sizeof(sm->tptk));
> ++	os_memset(&sm->gtk, 0, sizeof(sm->gtk));
> ++#ifdef CONFIG_IEEE80211W
> ++	os_memset(&sm->igtk, 0, sizeof(sm->igtk));
> ++#endif /* CONFIG_IEEE80211W */
> + #ifdef CONFIG_IEEE80211R
> + 	os_memset(sm->xxkey, 0, sizeof(sm->xxkey));
> + 	os_memset(sm->pmk_r0, 0, sizeof(sm->pmk_r0));
> +@@ -2879,29 +2924,11 @@ int wpa_wnmsleep_install_key(struct wpa_sm *sm, =
u8 subelem_id, u8 *buf)
> + 		os_memset(&gd, 0, sizeof(gd));
> + #ifdef CONFIG_IEEE80211W
> + 	} else if (subelem_id =3D=3D WNM_SLEEP_SUBELEM_IGTK) {
> +-		struct wpa_igtk_kde igd;
> +-		u16 keyidx;
> +-
> +-		os_memset(&igd, 0, sizeof(igd));
> +-		keylen =3D wpa_cipher_key_len(sm->mgmt_group_cipher);
> +-		os_memcpy(igd.keyid, buf + 2, 2);
> +-		os_memcpy(igd.pn, buf + 4, 6);
> +-
> +-		keyidx =3D WPA_GET_LE16(igd.keyid);
> +-		os_memcpy(igd.igtk, buf + 10, keylen);
> +-
> +-		wpa_hexdump_key(MSG_DEBUG, "Install IGTK (WNM SLEEP)",
> +-				igd.igtk, keylen);
> +-		if (wpa_sm_set_key(sm, wpa_cipher_to_alg(sm->mgmt_group_cipher),
> +-				   broadcast_ether_addr,
> +-				   keyidx, 0, igd.pn, sizeof(igd.pn),
> +-				   igd.igtk, keylen) < 0) {
> +-			wpa_printf(MSG_DEBUG, "Failed to install the IGTK in "
> +-				   "WNM mode");
> +-			os_memset(&igd, 0, sizeof(igd));
> +-			return -1;
> +-		}
> +-		os_memset(&igd, 0, sizeof(igd));
> ++		const struct wpa_igtk_kde *igtk;
> ++
> ++		igtk =3D (const struct wpa_igtk_kde *) (buf + 2);
> ++		if (wpa_supplicant_install_igtk(sm, igtk) < 0)
> ++ 			return -1;
> + #endif /* CONFIG_IEEE80211W */
> + 	} else {
> + 		wpa_printf(MSG_DEBUG, "Unknown element id");
> +diff --git a/src/rsn_supp/wpa_i.h b/src/rsn_supp/wpa_i.h
> +index 965a9c1..27b6123 100644
> +--- a/src/rsn_supp/wpa_i.h
> ++++ b/src/rsn_supp/wpa_i.h
> +@@ -30,6 +30,10 @@ struct wpa_sm {
> + 	u8 rx_replay_counter[WPA_REPLAY_COUNTER_LEN];
> + 	int rx_replay_counter_set;
> + 	u8 request_counter[WPA_REPLAY_COUNTER_LEN];
> ++	struct wpa_gtk gtk;
> ++#ifdef CONFIG_IEEE80211W
> ++	struct wpa_igtk igtk;
> ++#endif /* CONFIG_IEEE80211W */
> +
> + 	struct eapol_sm *eapol; /* EAPOL state machine from upper level code *=
/
> +
> +--
> +1.9.1
> +
> +From 76c0d1a21f0ebf00119e50bc57776d393ee4a30d Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 17:31:46 +0800
> +Subject: [PATCH 3/7] Extend protection of GTK/IGTK reinstallation of WNM=
-Sleep
> + Mode cases
> +
> +This extends the protection to track last configured GTK/IGTK value
> +separately from EAPOL-Key frames and WNM-Sleep Mode frames to cover a
> +corner case where these two different mechanisms may get used when the
> +GTK/IGTK has changed and tracking a single value is not sufficient to
> +detect a possible key reconfiguration.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/rsn_supp/wpa.c   | 53 +++++++++++++++++++++++++++++++++++++--------=
-------
> + src/rsn_supp/wpa_i.h |  2 ++
> + 2 files changed, 40 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
> +index eab7151..e7b5ca8 100644
> +--- a/src/rsn_supp/wpa.c
> ++++ b/src/rsn_supp/wpa.c
> +@@ -692,14 +692,17 @@ struct wpa_gtk_data {
> +
> + static int wpa_supplicant_install_gtk(struct wpa_sm *sm,
> + 				      const struct wpa_gtk_data *gd,
> +-				      const u8 *key_rsc)
> ++				      const u8 *key_rsc, int wnm_sleep)
> + {
> + 	const u8 *_gtk =3D gd->gtk;
> + 	u8 gtk_buf[32];
> +
> + 	/* Detect possible key reinstallation */
> +-	if (sm->gtk.gtk_len =3D=3D (size_t) gd->gtk_len &&
> +-	    os_memcmp(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len) =3D=3D 0) {
> ++	if ((sm->gtk.gtk_len =3D=3D (size_t) gd->gtk_len &&
> ++	     os_memcmp(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len) =3D=3D 0) ||
> ++	    (sm->gtk_wnm_sleep.gtk_len =3D=3D (size_t) gd->gtk_len &&
> ++	     os_memcmp(sm->gtk_wnm_sleep.gtk, gd->gtk,
> ++		       sm->gtk_wnm_sleep.gtk_len) =3D=3D 0)) {
> + 		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> + 			"WPA: Not reinstalling already in-use GTK to the driver (keyidx=3D%d=
 tx=3D%d len=3D%d)",
> + 			gd->keyidx, gd->tx, gd->gtk_len);
> +@@ -740,8 +743,14 @@ static int wpa_supplicant_install_gtk(struct wpa_sm=
 *sm,
> + 	}
> + 	os_memset(gtk_buf, 0, sizeof(gtk_buf));
> +
> +-	sm->gtk.gtk_len =3D gd->gtk_len;
> +-	os_memcpy(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len);
> ++	if (wnm_sleep) {
> ++		sm->gtk_wnm_sleep.gtk_len =3D gd->gtk_len;
> ++		os_memcpy(sm->gtk_wnm_sleep.gtk, gd->gtk,
> ++			  sm->gtk_wnm_sleep.gtk_len);
> ++	} else {
> ++		sm->gtk.gtk_len =3D gd->gtk_len;
> ++		os_memcpy(sm->gtk.gtk, gd->gtk, sm->gtk.gtk_len);
> ++	}
> +
> + 	return 0;
> + }
> +@@ -800,7 +809,7 @@ static int wpa_supplicant_pairwise_gtk(struct wpa_sm=
 *sm,
> + 	    (wpa_supplicant_check_group_cipher(sm, sm->group_cipher,
> + 					       gtk_len, gtk_len,
> + 					       &gd.key_rsc_len, &gd.alg) ||
> +-	     wpa_supplicant_install_gtk(sm, &gd, key->key_rsc))) {
> ++	     wpa_supplicant_install_gtk(sm, &gd, key->key_rsc, 0))) {
> + 		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> + 			"RSN: Failed to install GTK");
> + 		os_memset(&gd, 0, sizeof(gd));
> +@@ -815,14 +824,18 @@ static int wpa_supplicant_pairwise_gtk(struct wpa_=
sm *sm,
> +
> + #ifdef CONFIG_IEEE80211W
> + static int wpa_supplicant_install_igtk(struct wpa_sm *sm,
> +-				       const struct wpa_igtk_kde *igtk)
> ++				       const struct wpa_igtk_kde *igtk,
> ++				       int wnm_sleep)
> + {
> + 	size_t len =3D wpa_cipher_key_len(sm->mgmt_group_cipher);
> + 	u16 keyidx =3D WPA_GET_LE16(igtk->keyid);
> +
> + 	/* Detect possible key reinstallation */
> +-	if (sm->igtk.igtk_len =3D=3D len &&
> +-	    os_memcmp(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len) =3D=3D 0) =
{
> ++	if ((sm->igtk.igtk_len =3D=3D len &&
> ++	     os_memcmp(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len) =3D=3D 0)=
 ||
> ++	    (sm->igtk_wnm_sleep.igtk_len =3D=3D len &&
> ++	     os_memcmp(sm->igtk_wnm_sleep.igtk, igtk->igtk,
> ++		       sm->igtk_wnm_sleep.igtk_len) =3D=3D 0)) {
> + 		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> + 			"WPA: Not reinstalling already in-use IGTK to the driver (keyidx=3D%=
d)",
> + 			keyidx);
> +@@ -847,8 +860,14 @@ static int wpa_supplicant_install_igtk(struct wpa_s=
m *sm,
> + 		return -1;
> + 	}
> +
> +-	sm->igtk.igtk_len =3D len;
> +-	os_memcpy(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len);
> ++	if (wnm_sleep) {
> ++		sm->igtk_wnm_sleep.igtk_len =3D len;
> ++		os_memcpy(sm->igtk_wnm_sleep.igtk, igtk->igtk,
> ++			  sm->igtk_wnm_sleep.igtk_len);
> ++	} else {
> ++		sm->igtk.igtk_len =3D len;
> ++		os_memcpy(sm->igtk.igtk, igtk->igtk, sm->igtk.igtk_len);
> ++	}
> +
> + 	return 0;
> + }
> +@@ -871,7 +890,7 @@ static int ieee80211w_set_keys(struct wpa_sm *sm,
> + 			return -1;
> +
> + 		igtk =3D (const struct wpa_igtk_kde *) ie->igtk;
> +-		if (wpa_supplicant_install_igtk(sm, igtk) < 0)
> ++		if (wpa_supplicant_install_igtk(sm, igtk, 0) < 0)
> +  			return -1;
> + 	}
> +
> +@@ -1520,7 +1539,7 @@ static void wpa_supplicant_process_1_of_2(struct w=
pa_sm *sm,
> + 	if (ret)
> + 		goto failed;
> +
> +-	if (wpa_supplicant_install_gtk(sm, &gd, key->key_rsc) ||
> ++	if (wpa_supplicant_install_gtk(sm, &gd, key->key_rsc, 0) ||
> + 	    wpa_supplicant_send_2_of_2(sm, key, ver, key_info))
> + 		goto failed;
> + 	os_memset(&gd, 0, sizeof(gd));
> +@@ -2329,8 +2348,10 @@ void wpa_sm_notify_assoc(struct wpa_sm *sm, const=
 u8 *bssid)
> + 		sm->tptk_set =3D 0;
> + 		os_memset(&sm->tptk, 0, sizeof(sm->tptk));
> + 		os_memset(&sm->gtk, 0, sizeof(sm->gtk));
> ++		os_memset(&sm->gtk_wnm_sleep, 0, sizeof(sm->gtk_wnm_sleep));
> + #ifdef CONFIG_IEEE80211W
> + 		os_memset(&sm->igtk, 0, sizeof(sm->igtk));
> ++		os_memset(&sm->igtk_wnm_sleep, 0, sizeof(sm->igtk_wnm_sleep));
> + #endif /* CONFIG_IEEE80211W */
> + 	}
> +
> +@@ -2849,8 +2870,10 @@ void wpa_sm_drop_sa(struct wpa_sm *sm)
> + 	os_memset(&sm->ptk, 0, sizeof(sm->ptk));
> + 	os_memset(&sm->tptk, 0, sizeof(sm->tptk));
> + 	os_memset(&sm->gtk, 0, sizeof(sm->gtk));
> ++	os_memset(&sm->gtk_wnm_sleep, 0, sizeof(sm->gtk_wnm_sleep));
> + #ifdef CONFIG_IEEE80211W
> + 	os_memset(&sm->igtk, 0, sizeof(sm->igtk));
> ++	os_memset(&sm->igtk_wnm_sleep, 0, sizeof(sm->igtk_wnm_sleep));
> + #endif /* CONFIG_IEEE80211W */
> + #ifdef CONFIG_IEEE80211R
> + 	os_memset(sm->xxkey, 0, sizeof(sm->xxkey));
> +@@ -2915,7 +2938,7 @@ int wpa_wnmsleep_install_key(struct wpa_sm *sm, u8=
 subelem_id, u8 *buf)
> +
> + 		wpa_hexdump_key(MSG_DEBUG, "Install GTK (WNM SLEEP)",
> + 				gd.gtk, gd.gtk_len);
> +-		if (wpa_supplicant_install_gtk(sm, &gd, key_rsc)) {
> ++		if (wpa_supplicant_install_gtk(sm, &gd, key_rsc, 1)) {
> + 			os_memset(&gd, 0, sizeof(gd));
> + 			wpa_printf(MSG_DEBUG, "Failed to install the GTK in "
> + 				   "WNM mode");
> +@@ -2927,7 +2950,7 @@ int wpa_wnmsleep_install_key(struct wpa_sm *sm, u8=
 subelem_id, u8 *buf)
> + 		const struct wpa_igtk_kde *igtk;
> +
> + 		igtk =3D (const struct wpa_igtk_kde *) (buf + 2);
> +-		if (wpa_supplicant_install_igtk(sm, igtk) < 0)
> ++		if (wpa_supplicant_install_igtk(sm, igtk, 1) < 0)
> +  			return -1;
> + #endif /* CONFIG_IEEE80211W */
> + 	} else {
> +diff --git a/src/rsn_supp/wpa_i.h b/src/rsn_supp/wpa_i.h
> +index 27b6123..51753ee 100644
> +--- a/src/rsn_supp/wpa_i.h
> ++++ b/src/rsn_supp/wpa_i.h
> +@@ -31,8 +31,10 @@ struct wpa_sm {
> + 	int rx_replay_counter_set;
> + 	u8 request_counter[WPA_REPLAY_COUNTER_LEN];
> + 	struct wpa_gtk gtk;
> ++	struct wpa_gtk gtk_wnm_sleep;
> + #ifdef CONFIG_IEEE80211W
> + 	struct wpa_igtk igtk;
> ++	struct wpa_igtk igtk_wnm_sleep;
> + #endif /* CONFIG_IEEE80211W */
> +
> + 	struct eapol_sm *eapol; /* EAPOL state machine from upper level code *=
/
> +--
> +1.9.1
> +
> +From dc0d33ee697d016f14d0b6f3330720de2dfa9ad8 Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 17:55:19 +0800
> +Subject: [PATCH 4/7] Prevent installation of an all-zero TK
> +
> +Properly track whether a PTK has already been installed to the driver
> +and the TK part cleared from memory. This prevents an attacker from
> +trying to trick the client into installing an all-zero TK.
> +
> +Signed-off-by: Mathy Vanhoef <Mathy.Vanhoef@cs.kuleuven.be>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/common/wpa_common.h | 1 +
> + src/rsn_supp/wpa.c      | 7 +++++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/src/common/wpa_common.h b/src/common/wpa_common.h
> +index 21e13da..a04e759 100644
> +--- a/src/common/wpa_common.h
> ++++ b/src/common/wpa_common.h
> +@@ -213,6 +213,7 @@ struct wpa_ptk {
> + 	size_t kck_len;
> + 	size_t kek_len;
> + 	size_t tk_len;
> ++	int installed; /* 1 if key has already been installed to driver */
> + };
> +
> + struct wpa_gtk {
> +diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
> +index e7b5ca8..cb69b67 100644
> +--- a/src/rsn_supp/wpa.c
> ++++ b/src/rsn_supp/wpa.c
> +@@ -605,6 +605,12 @@ static int wpa_supplicant_install_ptk(struct wpa_sm=
 *sm,
> + 	const u8 *key_rsc;
> + 	u8 null_rsc[8] =3D { 0, 0, 0, 0, 0, 0, 0, 0 };
> +
> ++	if (sm->ptk.installed) {
> ++		wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> ++			"WPA: Do not re-install same PTK to the driver");
> ++		return 0;
> ++	}
> ++
> + 	wpa_dbg(sm->ctx->msg_ctx, MSG_DEBUG,
> + 		"WPA: Installing PTK to the driver");
> +
> +@@ -643,6 +649,7 @@ static int wpa_supplicant_install_ptk(struct wpa_sm =
*sm,
> +
> + 	/* TK is not needed anymore in supplicant */
> + 	os_memset(sm->ptk.tk, 0, WPA_TK_MAX_LEN);
> ++	sm->ptk.installed =3D 1;
> +
> + 	if (sm->wpa_ptk_rekey) {
> + 		eloop_cancel_timeout(wpa_sm_rekey_ptk, sm, NULL);
> +--
> +1.9.1
> +
> +From 9831007c38f18cd70a077fccc22c836100867138 Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 19:45:13 +0800
> +Subject: [PATCH 5/7] Fix PTK rekeying to generate a new ANonce
> +
> +The Authenticator state machine path for PTK rekeying ended up bypassing
> +the AUTHENTICATION2 state where a new ANonce is generated when going
> +directly to the PTKSTART state since there is no need to try to
> +determine the PMK again in such a case. This is far from ideal since the
> +new PTK would depend on a new nonce only from the supplicant.
> +
> +Fix this by generating a new ANonce when moving to the PTKSTART state
> +for the purpose of starting new 4-way handshake to rekey PTK.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/ap/wpa_auth.c | 23 ++++++++++++++++++++---
> + 1 file changed, 20 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/ap/wpa_auth.c b/src/ap/wpa_auth.c
> +index b38a64d..c603b1b 100644
> +--- a/src/ap/wpa_auth.c
> ++++ b/src/ap/wpa_auth.c
> +@@ -1895,6 +1895,20 @@ SM_STATE(WPA_PTK, AUTHENTICATION2)
> + 	sm->TimeoutCtr =3D 0;
> + }
> +
> ++static int wpa_auth_sm_ptk_update(struct wpa_state_machine *sm)
> ++{
> ++	if (random_get_bytes(sm->ANonce, WPA_NONCE_LEN)) {
> ++		wpa_printf(MSG_ERROR,
> ++			   "WPA: Failed to get random data for ANonce");
> ++		sm->Disconnect =3D TRUE;
> ++		return -1;
> ++	}
> ++	wpa_hexdump(MSG_DEBUG, "WPA: Assign new ANonce", sm->ANonce,
> ++		    WPA_NONCE_LEN);
> ++	sm->TimeoutCtr =3D 0;
> ++	return 0;
> ++}
> ++
> +
> + SM_STATE(WPA_PTK, INITPMK)
> + {
> +@@ -2417,9 +2431,12 @@ SM_STEP(WPA_PTK)
> + 		SM_ENTER(WPA_PTK, AUTHENTICATION);
> + 	else if (sm->ReAuthenticationRequest)
> + 		SM_ENTER(WPA_PTK, AUTHENTICATION2);
> +-	else if (sm->PTKRequest)
> +-		SM_ENTER(WPA_PTK, PTKSTART);
> +-	else switch (sm->wpa_ptk_state) {
> ++	else if (sm->PTKRequest) {
> ++		if (wpa_auth_sm_ptk_update(sm) < 0)
> ++			SM_ENTER(WPA_PTK, DISCONNECTED);
> ++		else
> ++			SM_ENTER(WPA_PTK, PTKSTART);
> ++	} else switch (sm->wpa_ptk_state) {
> + 	case WPA_PTK_INITIALIZE:
> + 		break;
> + 	case WPA_PTK_DISCONNECT:
> +--
> +1.9.1
> +
> +From 7ec70b3c5a5e32f7687999ef21c608524dcf35b9 Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 20:09:26 +0800
> +Subject: [PATCH 6/7] TDLS: Reject TPK-TK reconfiguration
> +
> +Do not try to reconfigure the same TPK-TK to the driver after it has
> +been successfully configured. This is an explicit check to avoid issues
> +related to resetting the TX/RX packet number. There was already a check
> +for this for TPK M2 (retries of that message are ignored completely), so
> +that behavior does not get modified.
> +
> +For TPK M3, the TPK-TK could have been reconfigured, but that was
> +followed by immediate teardown of the link due to an issue in updating
> +the STA entry. Furthermore, for TDLS with any real security (i.e.,
> +ignoring open/WEP), the TPK message exchange is protected on the AP path
> +and simple replay attacks are not feasible.
> +
> +As an additional corner case, make sure the local nonce gets updated if
> +the peer uses a very unlikely "random nonce" of all zeros.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/rsn_supp/tdls.c | 36 ++++++++++++++++++++++++++++++++++--
> + 1 file changed, 34 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/rsn_supp/tdls.c b/src/rsn_supp/tdls.c
> +index 722c20a..0878c62 100644
> +--- a/src/rsn_supp/tdls.c
> ++++ b/src/rsn_supp/tdls.c
> +@@ -112,6 +112,7 @@ struct wpa_tdls_peer {
> + 		u8 tk[16]; /* TPK-TK; assuming only CCMP will be used */
> + 	} tpk;
> + 	int tpk_set;
> ++	int tk_set; /* TPK-TK configured to the driver */
> + 	int tpk_success;
> + 	int tpk_in_progress;
> +
> +@@ -192,6 +193,20 @@ static int wpa_tdls_set_key(struct wpa_sm *sm, stru=
ct wpa_tdls_peer *peer)
> + 	u8 rsc[6];
> + 	enum wpa_alg alg;
> +
> ++	if (peer->tk_set) {
> ++		/*
> ++		 * This same TPK-TK has already been configured to the driver
> ++		 * and this new configuration attempt (likely due to an
> ++		 * unexpected retransmitted frame) would result in clearing
> ++		 * the TX/RX sequence number which can break security, so must
> ++		 * not allow that to happen.
> ++		 */
> ++		wpa_printf(MSG_INFO, "TDLS: TPK-TK for the peer " MACSTR
> ++			   " has already been configured to the driver - do not reconfigure"=
,
> ++			   MAC2STR(peer->addr));
> ++		return -1;
> ++	}
> ++
> + 	os_memset(rsc, 0, 6);
> +
> + 	switch (peer->cipher) {
> +@@ -209,12 +224,15 @@ static int wpa_tdls_set_key(struct wpa_sm *sm, str=
uct wpa_tdls_peer *peer)
> + 		return -1;
> + 	}
> +
> ++	wpa_printf(MSG_DEBUG, "TDLS: Configure pairwise key for peer " MACSTR,
> ++		   MAC2STR(peer->addr));
> + 	if (wpa_sm_set_key(sm, alg, peer->addr, -1, 1,
> + 			   rsc, sizeof(rsc), peer->tpk.tk, key_len) < 0) {
> + 		wpa_printf(MSG_WARNING, "TDLS: Failed to set TPK to the "
> + 			   "driver");
> + 		return -1;
> + 	}
> ++	peer->tk_set =3D 1;
> + 	return 0;
> + }
> +
> +@@ -690,7 +708,7 @@ static void wpa_tdls_peer_clear(struct wpa_sm *sm, s=
truct wpa_tdls_peer *peer)
> + 	peer->cipher =3D 0;
> + 	peer->qos_info =3D 0;
> + 	peer->wmm_capable =3D 0;
> +-	peer->tpk_set =3D peer->tpk_success =3D 0;
> ++	peer->tk_set =3D peer->tpk_set =3D peer->tpk_success =3D 0;
> + 	peer->chan_switch_enabled =3D 0;
> + 	os_memset(&peer->tpk, 0, sizeof(peer->tpk));
> + 	os_memset(peer->inonce, 0, WPA_NONCE_LEN);
> +@@ -1153,6 +1171,7 @@ skip_rsnie:
> + 		wpa_tdls_peer_free(sm, peer);
> + 		return -1;
> + 	}
> ++	peer->tk_set =3D 0; /* A new nonce results in a new TK */
> + 	wpa_hexdump(MSG_DEBUG, "TDLS: Initiator Nonce for TPK handshake",
> + 		    peer->inonce, WPA_NONCE_LEN);
> + 	os_memcpy(ftie->Snonce, peer->inonce, WPA_NONCE_LEN);
> +@@ -1744,6 +1763,17 @@ static int wpa_tdls_addset_peer(struct wpa_sm *sm=
, struct wpa_tdls_peer *peer,
> + 				       peer->supp_oper_classes_len);
> + }
> +
> ++static int tdls_nonce_set(const u8 *nonce)
> ++{
> ++	int i;
> ++
> ++	for (i =3D 0; i < WPA_NONCE_LEN; i++) {
> ++		if (nonce[i])
> ++			return 1;
> ++	}
> ++
> ++	return 0;
> ++}
> +
> + static int wpa_tdls_process_tpk_m1(struct wpa_sm *sm, const u8 *src_add=
r,
> + 				   const u8 *buf, size_t len)
> +@@ -1998,7 +2028,8 @@ skip_rsn:
> + 	peer->rsnie_i_len =3D kde.rsn_ie_len;
> + 	peer->cipher =3D cipher;
> +
> +-	if (os_memcmp(peer->inonce, ftie->Snonce, WPA_NONCE_LEN) !=3D 0) {
> ++	if (os_memcmp(peer->inonce, ftie->Snonce, WPA_NONCE_LEN) !=3D 0 ||
> ++	    !tdls_nonce_set(peer->inonce)) {
> + 		/*
> + 		 * There is no point in updating the RNonce for every obtained
> + 		 * TPK M1 frame (e.g., retransmission due to timeout) with the
> +@@ -2014,6 +2045,7 @@ skip_rsn:
> + 				"TDLS: Failed to get random data for responder nonce");
> + 			goto error;
> + 		}
> ++		peer->tk_set =3D 0; /* A new nonce results in a new TK */
> + 	}
> +
> + #if 0
> +--
> +1.9.1
> +
> +From 642f5eadf775b41bf3ddd8ffe77c33e785bda48f Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 12 Oct 2017 20:36:56 +0800
> +Subject: [PATCH 7/7] FT: Do not allow multiple Reassociation Response fr=
ames
> +
> +The driver is expected to not report a second association event without
> +the station having explicitly request a new association. As such, this
> +case should not be reachable. However, since reconfiguring the same
> +pairwise or group keys to the driver could result in nonce reuse issues,
> +be extra careful here and do an additional state check to avoid this
> +even if the local driver ends up somehow accepting an unexpected
> +Reassociation Response frame.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/rsn_supp/wpa.c    | 3 +++
> + src/rsn_supp/wpa_ft.c | 8 ++++++++
> + src/rsn_supp/wpa_i.h  | 1 +
> + 3 files changed, 12 insertions(+)
> +
> +diff --git a/src/rsn_supp/wpa.c b/src/rsn_supp/wpa.c
> +index cb69b67..05e5168 100644
> +--- a/src/rsn_supp/wpa.c
> ++++ b/src/rsn_supp/wpa.c
> +@@ -2391,6 +2391,9 @@ void wpa_sm_notify_disassoc(struct wpa_sm *sm)
> + #ifdef CONFIG_TDLS
> + 	wpa_tdls_disassoc(sm);
> + #endif /* CONFIG_TDLS */
> ++#ifdef CONFIG_IEEE80211R
> ++	sm->ft_reassoc_completed =3D 0;
> ++#endif /* CONFIG_IEEE80211R */
> +
> + 	/* Keys are not needed in the WPA state machine anymore */
> + 	wpa_sm_drop_sa(sm);
> +diff --git a/src/rsn_supp/wpa_ft.c b/src/rsn_supp/wpa_ft.c
> +index 205793e..d45bb45 100644
> +--- a/src/rsn_supp/wpa_ft.c
> ++++ b/src/rsn_supp/wpa_ft.c
> +@@ -153,6 +153,7 @@ static u8 * wpa_ft_gen_req_ies(struct wpa_sm *sm, si=
ze_t *len,
> + 	u16 capab;
> +
> + 	sm->ft_completed =3D 0;
> ++	sm->ft_reassoc_completed =3D 0;
> +
> + 	buf_len =3D 2 + sizeof(struct rsn_mdie) + 2 + sizeof(struct rsn_ftie) =
+
> + 		2 + sm->r0kh_id_len + ric_ies_len + 100;
> +@@ -681,6 +682,11 @@ int wpa_ft_validate_reassoc_resp(struct wpa_sm *sm,=
 const u8 *ies,
> + 		return -1;
> + 	}
> +
> ++	if (sm->ft_reassoc_completed) {
> ++		wpa_printf(MSG_DEBUG, "FT: Reassociation has already been completed f=
or this FT protocol instance - ignore unexpected retransmission");
> ++		return 0;
> ++	}
> ++
> + 	if (wpa_ft_parse_ies(ies, ies_len, &parse) < 0) {
> + 		wpa_printf(MSG_DEBUG, "FT: Failed to parse IEs");
> + 		return -1;
> +@@ -781,6 +787,8 @@ int wpa_ft_validate_reassoc_resp(struct wpa_sm *sm, =
const u8 *ies,
> + 		return -1;
> + 	}
> +
> ++	sm->ft_reassoc_completed =3D 1;
> ++
> + 	if (wpa_ft_process_gtk_subelem(sm, parse.gtk, parse.gtk_len) < 0)
> + 		return -1;
> +
> +diff --git a/src/rsn_supp/wpa_i.h b/src/rsn_supp/wpa_i.h
> +index 51753ee..85cc862 100644
> +--- a/src/rsn_supp/wpa_i.h
> ++++ b/src/rsn_supp/wpa_i.h
> +@@ -127,6 +127,7 @@ struct wpa_sm {
> + 	size_t r0kh_id_len;
> + 	u8 r1kh_id[FT_R1KH_ID_LEN];
> + 	int ft_completed;
> ++	int ft_reassoc_completed;
> + 	int over_the_ds_in_progress;
> + 	u8 target_ap[ETH_ALEN]; /* over-the-DS target AP */
> + 	int set_ptk_after_assoc;
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb b/meta-o=
e/recipes-connectivity/hostapd/hostapd_2.5.bb
> index ab01235ec913..81b2fb685311 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D " \
>       file://init \
>       file://hostapd.service \
>       file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
> +    file://key-replay-cve-multiple.patch \
>   "
>  =20
>   S =3D "${WORKDIR}/hostapd-${PV}"

