Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC486D7C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:56:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id g6so1527968plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8JD7VhBcTqT5CXjcXXMnU2s3ajd4NsAjF6D16LyrTlU=;
	b=WjxIyrE+TctYCxWgwY1V/xEXwtG3W4zSReYz2s3oKDvzDNSsZxtDktYvyJ6X1K2Wv8
	Z3mbxIwvsqVEUmzU+QMuzXN52VmbJnYE4TF4FhrUPuFrni+ttKeQLE3v76cufXyn3KQG
	DqJu2WbyyC8jUW7QZdr94X3XjA2UPCYpePQjdRuMm5/zgRjgUgm9r4yAKDAZF2c28zG1
	Id1/NrA71Tt5a0JIkuN7XdCYF1/PMQUlCzguRiXe2JoYTTi0LX72P4rrf3OFu1zRn0eh
	XCbdyl3i2+v79HTz8fUooKNRt0y7bvnDVKj/AwYdH/7oVvn+gpdPg+CQPah+dEU4/btf
	CCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8JD7VhBcTqT5CXjcXXMnU2s3ajd4NsAjF6D16LyrTlU=;
	b=bo4d0XsiWD6UjBrEvDy1M3RzftTQv8deTmCmlroaCZyP9gj7VIwTpZNGq1kJFw1SfA
	jGXixwB7m039yxQ3baQVTWxKVDatrOJqyykEroRdSzRXxTZNeAd1zL4Uf+3ZpfoP1qjf
	+wYcIe0rB8yHFzGIKM2mL3bNyFpxRn+eN+bdfYAG2n1Xv16Tpr/t2ldpDMQHU1pHk8tD
	rdSNlj3vXE3rmhwhn0/2qIUXAwJ4Aa1watwgotIwlpmCGNR2N6r9kHVTgBODFTTKAvZl
	P6EznhgzJHTLKbHVn2YAgWybmeWfIAg89lMMM/LphYjQulQHWOAYTzPHJo4N5gO7RRqc
	nTig==
X-Gm-Message-State: APjAAAX0y2jAM6hO4MTAc1pkQ6JTx2x+pf7bXJirDr1aeQHC4VfLlVFm
	UsPEFTf2bGPkWyqcOQk6l0WB+zgYKoo=
X-Google-Smtp-Source: APXvYqyfOPhY13JoYXvRDzVQZ3Mx71C2Khm+Xm0G8IhBy1hwUOHpdQFWnnVHpRO/OGUkHVfz7173gw==
X-Received: by 2002:a17:90b:1115:: with SMTP id
	gi21mr5199613pjb.95.1576702567092; 
	Wed, 18 Dec 2019 12:56:07 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:dd5b:acf6:7dd2:90d0?
	([2601:646:9200:4e0:dd5b:acf6:7dd2:90d0])
	by smtp.gmail.com with ESMTPSA id w6sm4932840pfq.99.2019.12.18.12.56.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Dec 2019 12:56:06 -0800 (PST)
To: Peter Kolbus <peter.kolbus@garmin.com>,
	openembedded-devel@lists.openembedded.org
References: <20191218201337.78070-1-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <796766f9-9aab-f5a0-e8e8-63de05996b27@gmail.com>
Date: Wed, 18 Dec 2019 12:56:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191218201337.78070-1-peter.kolbus@garmin.com>
Subject: Re: [meta-python][PATCH] python(3)-requests: add DEPENDS_class-native
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
X-List-Received-Date: Wed, 18 Dec 2019 20:56:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter

On 12/18/19 12:13 PM, Peter Kolbus wrote:
> Change-Id: Ie8bd80d56da599b29430da65b303d69bba43fdda

Is this gerrit tag useful for you once upstreamed ? I ask because in 
general this will be redundant information that I would prefer to not 
have in logs.

> ---
>   .../recipes-devtools/python/python-requests.inc        | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
> index 5fe5dc21f..ea2983821 100644
> --- a/meta-python/recipes-devtools/python/python-requests.inc
> +++ b/meta-python/recipes-devtools/python/python-requests.inc
> @@ -23,6 +23,16 @@ RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-idna \
>   "
>   
> +DEPENDS_class-native += " \
> +    ${PYTHON_PN}-ndg-httpsclient-native \
> +    ${PYTHON_PN}-pyasn1-native \
> +    ${PYTHON_PN}-pyopenssl-native \
> +    ${PYTHON_PN}-pysocks-native \
> +    ${PYTHON_PN}-urllib3-native \
> +    ${PYTHON_PN}-chardet-native \
> +    ${PYTHON_PN}-idna-native \
> +"
> +
>   CVE_PRODUCT = "requests"
>   
>   BBCLASSEXTEND = "native nativesdk"
> 


