Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
 by mx.groups.io with SMTP id smtpd.web08.942.1620669145664785507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 10:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=OSI1Erhd;
 spf=pass (domain: pr.hu, ip: 87.242.0.7, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1lgA4s-0007tJ-IT
	for openembedded-devel@lists.openembedded.org; Mon, 10 May 2021 19:52:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Vr40KrpO+69Y1vQjVywk7hItngrIgTn7F+aPSdLokx8=; b=OSI1Erhdljovuhwj+P6hyYYb1m
	RlpJpZEkd3Ulu1nBOL+ed43PftDisB1fU4gCQxYS9EEYE3yoh1berNdoWpiKIrDStF+z/1XzP4YrN
	TruNd0d293mhd+diWPlxZRJdNIGEHzFuaRcEqPFfsrvSRP6PyUlC6zyYv0Y6g1M7sgs0rHwCrLZ9z
	d6wV8HIUmDNRWne7zVajnulavIqtjkRaFmy2uigULJDl19msR68A97vhD9+Oe19O4ZwvxnYqXCZdW
	+RLpRzMtxsnhIgrjWnvjPJRhy5zuFKECDssSMJCyHDMuHrA3wPZbxsh0sULlvH+TfYFTC3NrucWJu
	1l/CCueg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1lgA4o-0003Zr-Nl
	for openembedded-devel@lists.openembedded.org; Mon, 10 May 2021 19:52:20 +0200
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: ovmf-native build error with GCC 11 host compiler
Message-ID: <1a68d742-389c-b39a-e97f-ff8a29d930f3@pr.hu>
Date: Mon, 10 May 2021 19:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: eb3d9b7f1f3400e9adcc1170d01d5e4d
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210510175220Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

it's a genuine build error with Hardknott on Fedora 34:

brotli/c/dec/decode.c:2033:41: error: argument 2 of type ‘const uint8_t *’ {aka ‘const 
unsigned char *’} declared as a pointer [-Werror=vla-parameter]
  2033 |     size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
       |                          ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
In file included from brotli/c/dec/decode.c:7:
./brotli/c/include/brotli/decode.h:204:19: note: previously declared as a variable length 
array ‘const uint8_t[*decoded_size]’ {aka ‘const unsigned char[*decoded_size]’}
   204 |     const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
       |     ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
brotli/c/dec/decode.c:2034:14: error: argument 4 of type ‘uint8_t *’ {aka ‘unsigned char 
*’} declared as a pointer [-Werror=vla-parameter]
  2034 |     uint8_t* decoded_buffer) {
       |     ~~~~~~~~~^~~~~~~~~~~~~~
In file included from brotli/c/dec/decode.c:7:
./brotli/c/include/brotli/decode.h:206:13: note: previously declared as a variable length 
array ‘uint8_t[encoded_size]’ {aka ‘unsigned char[encoded_size]’}
   206 |     uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]);
       |     ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Comparing GCC 10 and 11, -Wvla-parameter is new in GCC 11 and
it's part of to -Wall.

Best regards,
Zoltán Böszörményi
