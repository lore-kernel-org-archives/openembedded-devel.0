Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B432746E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 15:41:24 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id o14-v6so12041976ljj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5szh6P01LsrxRzryN+JFjYEb9mvThzCsN1tlW6xO7S4=;
	b=rGMMB6wZe3wOZrUh8glxicNeE1yY/O5T7Fnpdb+TIS2PaM5VWtGCqp5uqKR9Migk3H
	1b0j1MGZJ4XmiCYrpsfdSPsVxO96stZA336g718gGzn9ZPaXUhspQBBsveUDUX/mWalR
	3Prxy/OdO+LDVmBMw9KUrGc7PyTtOcN8i29NDoDNirACwnI9xxRINx3YV18rO4sYcRRT
	8OMt7TqHt54TO1/mlmmQpsbkEQ8zbFsIGf1nTDYcKsudWEpQiTYQuRNciZGY+c+/tcxA
	8PsfUMhM95uL+9Noxqvkmv1pV8N3hi0QyMwjZaj62gXdc8nJsieHw5EZlai9QCBWnaFS
	T67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5szh6P01LsrxRzryN+JFjYEb9mvThzCsN1tlW6xO7S4=;
	b=pUlAdLfUm3dQDYR8RCyNW9EBT/XOsDNijLOZusGxW1rWOvHMK9uXREUik7j9vMOd3F
	+4PGUEh0BCdSq0DeCYV2NU1Rj7oim9hDqtXTOVwvsTIDjDvz62EbFPWlHtec30wY7GyG
	31LthWPq+VtaqlYk1NmtOoEzD1AXVLM+UJXHF1KMuY6/kKKNBJA61li98NgtchPXoZhq
	1953yoKBwWfX3GXuutk1Y3SXcZ/tGC+KqtCrdSyLeO5Jw1nJMz6Jg7PO/ZBAUO733z9H
	x+2gp8XubQs8ffTfPbAzz6J8J2zZzFfP4uuBSOLq1ZaBF5vV8VO4qvSfwD6OIDFCoD7l
	k0Lg==
X-Gm-Message-State: ABuFfojPMNqaZiG9nZMD0Ay1THjTEWlBpOoZVuovnAunBuCoU4AkW+vV
	gtEIl1yKFlslxZ6tOttWmd7ytmW1LOWvxyw5eqU=
X-Google-Smtp-Source: ACcGV61a3eVjYL64dnFmMyI+UwBvx3iJAfmxn1/+xsyMcy7lEZyR3dQxl+4QKEGEpXpGms/UZeg9L+rH/5cYYoa5WAM=
X-Received: by 2002:a2e:5109:: with SMTP id
	f9-v6mr7668867ljb.155.1538754084380; 
	Fri, 05 Oct 2018 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
In-Reply-To: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Oct 2018 11:41:12 -0400
Message-ID: <CADkTA4MXWfH=TY4hDro=33nvoPBYNx3P-4uEY2k=Li+xsadhfQ@mail.gmail.com>
To: okaya@kernel.org
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo] [meta-virtualization] [PATCH v1] docker: CVE-2018-10892
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
X-List-Received-Date: Fri, 05 Oct 2018 15:41:24 -0000
Content-Type: text/plain; charset="UTF-8"

Wrong list.

This needs to go to the meta-virtualization mailing list.

Bruce
On Thu, Oct 4, 2018 at 11:48 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> * CVE-2018-10892
> Docker does not block /proc/acpi pathnames. The flaw allows an attacker to
> modify host's hardware like enabling/disabling Bluetooth or turning up/down
> keyboard brightness.
>
> Affects < 18.03.01
>
> CVE: CVE-2018-10892
> Ref: https://access.redhat.com/security/cve/cve-2018-10892
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   recipes-containers/docker/docker_git.bb       |  2 ++
>   .../docker/files/CVE-2018-10892.patch         | 34 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 recipes-containers/docker/files/CVE-2018-10892.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index e055a4f..7c7bd4c 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -30,6 +30,8 @@ SRC_URI = "\
>           file://0001-libnetwork-use-GO-instead-of-go.patch \
>         "
>
> +SRC_URI_append_docker += "CVE-2018-10892.patch"
> +
>   # Apache-2.0 for docker
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
> diff --git a/recipes-containers/docker/files/CVE-2018-10892.patch
> b/recipes-containers/docker/files/CVE-2018-10892.patch
> new file mode 100644
> index 0000000..60d0496
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2018-10892.patch
> @@ -0,0 +1,34 @@
> +From af52f266ea15e6000ed057b13d62d27ddd5441a0 Mon Sep 17 00:00:00 2001
> +From: Antonio Murdaca <runcom@redhat.com>
> +Date: Thu, 5 Jul 2018 17:06:08 +0200
> +Subject: [PATCH] Add /proc/acpi to masked paths
> +
> +The deafult OCI linux spec in oci/defaults{_linux}.go in Docker/Moby
> +from 1.11 to current upstream master does not block /proc/acpi pathnames
> +allowing attackers to modify host's hardware like enabling/disabling
> +bluetooth or turning up/down keyboard brightness. SELinux prevents all
> +of this if enabled.
> +
> +Signed-off-by: Antonio Murdaca <runcom@redhat.com>
> +CVE: CVE-2018-10892
> +Upstream-Status: Backport
> [https://github.com/moby/moby/pull/37404/commits/569b9702a59804617e1cd3611fbbe953e4247b3e]
> +Signed-off-by: Sinan Kaya<okaya@kernel.org>
> +---
> + oci/defaults.go | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/oci/defaults.go b/oci/defaults.go
> +index 4145412dd..992157b0f 100644
> +--- a/oci/defaults.go
> ++++ b/oci/defaults.go
> +@@ -114,6 +114,7 @@ func DefaultLinuxSpec() specs.Spec {
> +
> +       s.Linux = &specs.Linux{
> +               MaskedPaths: []string{
> ++                      "/proc/acpi",
> +                       "/proc/kcore",
> +                       "/proc/keys",
> +                       "/proc/latency_stats",
> +--
> +2.19.0
> +
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

