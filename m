Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3607F238
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:40:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n7so33860725qtb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3ZN+RtQrNjiIRy4Aq27YmpEqR6PVvwhsQEpMr9yThKQ=;
	b=b8hxn04xbGzYOb4lUtkOi6URz29CAs3yqNYuj9jcuZYSJoyAQ5gdEVgzLSaV01LgWA
	EZqDMTyCQsP5usp3hSuoQ9P4zfHSSL1O+1tQ5JflfRb/bEDALCycQhVL5gMywT+DavNI
	/8RnkZVPoi/tMW+LoYZBmrSRf8OHw4f8LoSRKrF2On0/UJFuf0KwOiKFJAzbaLuBd7Bh
	4q3zeuyo7PlQkHL043ACdlTRmBRqbikg5+IoV+48MYZ94uehZWfw/TFwmmZuQyRCF5p5
	INhupUPLLZWHTV9Cw9YiAyZRSpSoU4TP9k5D/Ndp3shNonx3M3A8G3eqh0QZQdzTtiNP
	svDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3ZN+RtQrNjiIRy4Aq27YmpEqR6PVvwhsQEpMr9yThKQ=;
	b=SZJ21Ys3JLebN8+udLXdpeMk9Q0x6xnSab7J1jMvIhIcuA2HPcsQN/I2deBhqTeLBq
	kShoAnr30jn6oO+UuUfbQSV/8fILnXPBO1+DZg9lHn8Lp3XCC6aoS+Ln8C1xSg8QsMUB
	6vFQR5Gi2QNWvOeY9Fda7JepnOJU3QqZf/7HO0jk5wqCQtfJDWX++AoULQjSSlh/uoti
	IO9mtJ28NId5DnHNvXCyPTLHSHim+N3qMQ2PNQgIMw9MBiUCZkPgPEgRrzHV0L4JX5AL
	hjy1rfoQQ9x6KTs/yz0kVGI2IAu8njBeTAbY4B8aXnU/AUo6QOhG/dna08V5+RL+rhM+
	9rjQ==
X-Gm-Message-State: APjAAAVWblMW1i1AU3fLb7/aVvg18VqsexGuE1cwR0UXMPxzOnJyjN0T
	zI67tvbxLoEFU2S0NOIGxXRxTcXdwseNOcftUZe3PX4iR7I=
X-Google-Smtp-Source: APXvYqxIs3pKO2rFqpykXrLlLX8K0X2inFH+cb/l+gLG10UHFtGDMhOPR3MpYCOL1EIQHpcUjlQLYAtrlYaPFtfnuyU=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr41482104qte.80.1571193627529; 
	Tue, 15 Oct 2019 19:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191015225422.18179-1-alistair.francis@wdc.com>
	<20191015225422.18179-5-alistair.francis@wdc.com>
In-Reply-To: <20191015225422.18179-5-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2019 19:40:16 -0700
Message-ID: <CAMKF1spM=ZZVrct1NTfNLBuvS2b8YVY05Fu2F7qOtT0r85bLjQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 5/7] python3-google-api-python-client: Initial commit of 1.7.11
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
X-List-Received-Date: Wed, 16 Oct 2019 02:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

meta-python is probably better place for this


On Wed, Oct 16, 2019 at 4:30 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../python/python3-google-api-python-client_1.7.11.bb    | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-google-api-python-client_1.7.11.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-google-api-python-client_1.7.11.bb
> b/meta-python/recipes-devtools/python/
> python3-google-api-python-client_1.7.11.bb
> new file mode 100644
> index 000000000..25e3b9c3f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/
> python3-google-api-python-client_1.7.11.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "The Google API Client for Python is a client library for
> accessing the Plus, Moderator, and many other Google APIs."
> +HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
> +
> +SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
> +SRC_URI[sha256sum] =
> "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
> +
> +inherit pypi setuptools3
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

