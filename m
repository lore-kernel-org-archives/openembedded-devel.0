Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 787487760E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:22:43 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id t20so46948033wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Ve1hOFQy1wPme95PtZIkcSp0PLTAcmV+GNLRvA8aVw=;
	b=jeiLaMJmHjIrlvggMiFJRZ7paULdvY706ywcWquyAqoE3tBycS3/hx6T/MUc0ddWLb
	VcLrG0aOu6SiJsL/FOXKSeHq+MKEb/isUOUgtpQ4Vl7Rwkqkz+3mJp2shcyzE8pTW+3Q
	TaqtQPXy+xFwQJjdTjXYpX1IwnIynpaH46v7T33LY3pyDwRR5SpFTjpvVJnFCve6+Yh9
	H8JYI06nF/BQBCAAywhgXZKfOcb0UogGVVLncsf0GpJ+FlLaB5MIeoyhRtjkW6uoFvJX
	YvMQtbGRTNSbWciPPRuYxeOvCF2YGQmB6DTMuIUSpTfB7YNP7zIgLPr9bffXpSUKNpC7
	/nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Ve1hOFQy1wPme95PtZIkcSp0PLTAcmV+GNLRvA8aVw=;
	b=Tco/a3qff2GiET1mxNRDdj73ZK/TqE5SO+dnixCrshK5aHjT4smb/7M1CzstG68Eij
	N5jNAsgfE89X/URxk7+9GO2jxbmILI4slb2tzRyUboJBgi0bJN0zv5fMPKn0SYT+XMLv
	olK33k3OPEWs8m9V8mtXjMeJg/Ai6ZHbYPsPLxVXZkJRPOi9K0yPl6e3ktLxP6nYk8op
	JoekDDxOXJhG12B4b++ajTCsyGO4iaZxN3rEa31WBEmb+8jQe7JPG8nSxh97rk2psJ7x
	vY7EVOqlyR6WJVRFn2fqRrymU3Hnn1CztTfK/L3w0opVlTBU+lH1A8yRtdcMPe0A2Ezk
	rlQA==
X-Gm-Message-State: AN3rC/51H2rBC9b+tF2EeigtWjAZRKbKdHbfSFLM7m79eUPHDssEnDFwkUH/r1aWSgAiMvSmpa+gKKz4Y+muPQ==
X-Received: by 10.223.136.165 with SMTP id f34mr4539975wrf.145.1491463365063; 
	Thu, 06 Apr 2017 00:22:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:22:44 -0700 (PDT)
In-Reply-To: <20170406010452.16529-1-andrej.rode@ettus.com>
References: <20170406010452.16529-1-andrej.rode@ettus.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:22:44 +0200
Message-ID: <CA+chaQf7c+MARecNmxYBO8bX4Y1SRxZjedbM1utkD4mq5fKm=Q@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 07:22:46 -0000
Content-Type: text/plain; charset=UTF-8

The Signed-off-by: line should be in commit message, not in separate
e-mail, patchwork might include the SOB, but it will still leave empty
commit message body, why don't you move your reply there?

On Thu, Apr 6, 2017 at 3:04 AM, Andrej Rode <andrej.rode@ettus.com> wrote:

> Adds recipe for python-gsocketpool as a dependency for python-mprpc
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  .../python-gsocketpool/python-gsocketpool_0.1.5.bb           | 12
> ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/
> python-gsocketpool_0.1.5.bb
>
> diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-
> gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-
> gsocketpool/python-gsocketpool_0.1.5.bb
> new file mode 100644
> index 0000000..ae7f264
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-gsocketpool/python-
> gsocketpool_0.1.5.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "A simple connection pool for gevent"
> +DESCRIPTION = "creates a pool of connections that can be used with gevent"
> +HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "python-gevent"
> +RDEPENDS_${PN} += "python-gevent"
> +
> +SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
> +SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5
> c3b9c40a971f62e13607b881aa749af9d0"
> +
> +inherit pypi setuptools
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

