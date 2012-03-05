Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vita.preskovsky@gmail.com>) id 1S4Y94-0006sj-Ho
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 14:40:10 +0100
Received: by ghbz2 with SMTP id z2so1503023ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=oy3BZXrYebyK/LykwrgoI1bw9v8YFRb9E0kMKUGa1wo=;
	b=FXbNTwdCp6DHDa3mG/uaZEQntYAn9IqHYbstBTfTkcgZkSs8SRdEIcKnB7IQxcNqkO
	LDDI5Aim73rZCOq7T8YrIJOtlKjGFoJVYMqz+HxW7Hi1vFMCDvoleXGD5AqOGhTOTjXR
	jWPttImYQPzQ/PbPIOJkQ/wzMgiEtGrKMbaXJeu6PcFCdVKJQJeBWPDmerzczr7tjpe9
	5ayy/4z1T04BogvulQnNwCW7E6lQEeIvHgiua3bzZ0sI9ohkxm3glqADASkDzYgshCYQ
	Umie4SWzb00Q8Mo10JpUD/pC08zS9TANpFrMDik5EWUDQcZyRx/t6fnFMHgssPZr31ye
	YvsQ==
Received: by 10.50.156.166 with SMTP id wf6mr5467438igb.20.1330954295242; Mon,
	05 Mar 2012 05:31:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.43.47.132 with HTTP; Mon, 5 Mar 2012 05:31:15 -0800 (PST)
In-Reply-To: <1329919327-30523-1-git-send-email-vitap@ti.com>
References: <1329919327-30523-1-git-send-email-vitap@ti.com>
From: Vita Preskovsky <vita.preskovsky@gmail.com>
Date: Mon, 5 Mar 2012 15:31:15 +0200
Message-ID: <CABJWmRYipkad25Ra8QiCZL_-1q7Vni8fykh6LSzXoyPnWWcG6w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] bluez4: two patches for 4.98
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 13:40:10 -0000
Content-Type: text/plain; charset=UTF-8

Ping on this

On Wed, Feb 22, 2012 at 4:02 PM, Vita Preskovsky
<vita.preskovsky@gmail.com>wrote:

> * Adding two patches fixing functionality
> of bluez-4.98. The first fixes
> the synchronization between bluetoothd
> and driver. And the second is necessary
> for A2DP to work.
>
>
> Signed-off-by: Vita Preskovsky <vitap@ti.com>
> ---
>  recipes/bluez/bluez4_4.98.bb                       |    2 +
>  .../files/0001-socket-enable-for-bluez-4_98.patch  |   25 ++++++++++
>  ...synchronization-between-bluetoothd-and-dr.patch |   50
> ++++++++++++++++++++
>  3 files changed, 77 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
>  create mode 100755
> recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
>
> diff --git a/recipes/bluez/bluez4_4.98.bb b/recipes/bluez/bluez4_4.98.bb
> index 2303994..1a5fd21 100644
> --- a/recipes/bluez/bluez4_4.98.bb
> +++ b/recipes/bluez/bluez4_4.98.bb
> @@ -3,6 +3,8 @@ require bluez4.inc
>  SRC_URI = "\
>  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
>  file://bluetooth.conf \
> + file://0001-socket-enable-for-bluez-4_98.patch \
> + file://0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
>  "
>  SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
>  SRC_URI[sha256sum] =
> "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
> diff --git a/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
> b/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
> new file mode 100644
> index 0000000..05cb2ee
> --- /dev/null
> +++ b/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
> @@ -0,0 +1,25 @@
> +From e142a28897c0b0fe9e61259a96dad6fb9f818ecd Mon Sep 17 00:00:00 2001
> +From: Moosa <moosa.baransi@babcomsoftware.com>
> +Date: Wed, 22 Feb 2012 10:06:37 +0200
> +Subject: [PATCH] socket enable for bluez 0_98
> +
> +* This is necessary for working with A2DP
> +---
> + audio/audio.conf |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/audio/audio.conf b/audio/audio.conf
> +index 302e046..9533ada 100644
> +--- a/audio/audio.conf
> ++++ b/audio/audio.conf
> +@@ -3,6 +3,7 @@
> + # This section contains options which are not specific to any
> + # particular interface
> + [General]
> ++Enable=Socket
> +
> + # Switch to master role for incoming connections (defaults to true)
> + #Master=true
> +--
> +1.7.1
> +
> diff --git
> a/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
> b/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
> new file mode 100755
> index 0000000..4897647
> --- /dev/null
> +++
> b/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
> @@ -0,0 +1,50 @@
> +From ddca351e504dc3cb8d91ea10a1863949699c6e50 Mon Sep 17 00:00:00 2001
> +From: Vita Preskovsky <vitap@ti.com>
> +Date: Tue, 13 Dec 2011 22:54:47 +0200
> +Subject: [PATCH] bluez4: fix synchronization between bluetoothd and driver
> +  * To fix situation when bluetoothd doesn't get messages
> +    it expects to receive from the kernel. Therefore the
> +    the required requests are sent again at the stage when device
> +    is up. The mismatch caused to the list of adapters to be
> +    empty.
> +
> +Signed-off-by: Vita Preskovsky <vitap@ti.com>
> +---
> + plugins/hciops.c |   21 +++++++++++++++++++++
> + 1 files changed, 21 insertions(+), 0 deletions(-)
> +
> +diff --git a/plugins/hciops.c b/plugins/hciops.c
> +index ecc0e86..e2198ee 100644
> +--- a/plugins/hciops.c
> ++++ b/plugins/hciops.c
> +@@ -2512,6 +2512,27 @@ static void device_devup_setup(int index)
> +       hci_send_cmd(dev->sk, OGF_HOST_CTL, OCF_READ_STORED_LINK_KEY,
> +                                       READ_STORED_LINK_KEY_CP_SIZE, &cp);
> +
> ++      /* Even though it shouldn't happen it seems like we might miss
> ++       * initialization commands that kernel sends. So we check it here
> ++       * to avoid situation when we have device but it is not in the list
> ++       * of adapters. */
> ++       if (hci_test_bit(PENDING_FEATURES, &dev->pending))
> ++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
> ++                                       OCF_READ_LOCAL_FEATURES, 0, NULL);
> ++
> ++       if (hci_test_bit(PENDING_VERSION, &dev->pending))
> ++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
> ++                                       OCF_READ_LOCAL_VERSION, 0, NULL);
> ++
> ++       if (hci_test_bit(PENDING_NAME, &dev->pending))
> ++               hci_send_cmd(dev->sk, OGF_HOST_CTL,
> ++                                       OCF_READ_LOCAL_NAME, 0, NULL);
> ++
> ++       if (hci_test_bit(PENDING_BDADDR, &dev->pending))
> ++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
> ++                                       OCF_READ_BD_ADDR, 0, NULL);
> ++
> ++
> +       if (!dev->pending)
> +               init_adapter(index);
> + }
> +--
> +1.7.0.4
> +
> --
> 1.7.0.4
>
>

