Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TTWzc-0007jF-4M
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:01:56 +0100
Received: by mail-la0-f47.google.com with SMTP id h5so907187lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=KeADYeMApBNzIMt9Aap9pL4aUT9Ou1pCvJQmjMDIfcU=;
	b=lQ6+Jgz4R21H9hDvNOZpxkmM6J64Dx9QIVyPyTbNDtpCv2wVyk4jR2ssIn3s/gXP9C
	TVQnLoxwN5IG8yoYDmQoTrr/GslXOg7NzLv5CiRN/OWF84cDkQ6+8/DX/BwigJBJrl1D
	5GJClMogXWUl4mlpVy+mmkRzB/wgFpH9Nfax0QN+QcwBmGBfjYXzxmoJtn6/VyrhlX41
	uwdBmRn0dryCV/nneEUADFzebVZ0UPEsATR0n3UHOCMSnq8MHVGrLD9Zgup0w2KdlLXE
	3WvtbEecrkTpjFlNtBv1K3NFVRhmxyYt/fQeau3FBV4rzoNNYhmGzt9w4L09vlTTYyJE
	WSnw==
Received: by 10.152.105.173 with SMTP id gn13mr33432526lab.41.1351684099402;
	Wed, 31 Oct 2012 04:48:19 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id b4sm1342794lbi.0.2012.10.31.04.48.17
	(version=SSLv3 cipher=OTHER); Wed, 31 Oct 2012 04:48:18 -0700 (PDT)
Message-ID: <50910EFB.7010804@gmail.com>
Date: Wed, 31 Oct 2012 12:43:55 +0100
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:01:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

For this you should also have a look at the ntpdate.service and
ntp.service files. There was a discussion about this earlier:
http://patches.openembedded.org/patch/38575/

Also, what is not on that discussion, is that pool.ntp.org is not really
the way to do it. What we would like is to register something like
pool.yocto.ntp.org, but for
now I guess we can just use pool.ntp.org and then change it when someone
have registered it. Kind of feel someone officially related to the
project should register it.

- Martin


On 10/31/12 12:08, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-support/ntp/ntp/ntpd.service           |    0
>  .../recipes-support/ntp/ntp/ntpdate.service        |    0
>  .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |    0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
>  rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (100%)
>  rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp_4.2.6p3.bbappend (100%)
>
> diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
> rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
> diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
> rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
> rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend



