Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3A860C18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 20:15:28 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id d62so7088262oia.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=83qpFzw/n6T0N/yx1Ra/a80ouq7eUeNacIZTC6W4oHo=;
	b=WPmRfgnWe3tad7jlDxR8aTAW0e/VXGHtun/+UkW/gyFiXXO9cvVUCvx2LqKWAsyPBZ
	9qgFvHQb8GKUb4Yi2llbYTuEfBjNT4koOlMWGcXyGStTRpBMpD54e427OJpY0vVk41t9
	0aFsjQqAOAzC3MhF58WouM60xM18xnQ5ArWBY5RREKQKmK87bjY5vqf3RKLo2kYx0Y5F
	Q5F68uAZyTouiKuX8d6+D9C8w9iDqBNbuH8eF7Uz+XOFdEBjX4RBXLZPrWnjV++81Npw
	7FsaLlQgVwkdVp7WpS9TSGyjjNi7AJWmiW5fb+SlBff4SjmtDecd/gcXGdnADC9h5XLh
	pwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=83qpFzw/n6T0N/yx1Ra/a80ouq7eUeNacIZTC6W4oHo=;
	b=PcA3E8Ax0Kjx1P0DzKqtx+Ym1OaHQNrNtXsbHg2r8a7WC4flZvkxLLZhvIzsRFhyAA
	sbrfZPNM7+a9w0IOHFsDRV/brrDKhRL4/hcsvrYsi7Hgf04oSrfnbPNZAco1zR1zROPD
	ie0wsieH8q4RkqYSsVsJ2Cd3D98Xgw1ZfQGSDr1PWbXZOAx/c5fOnR8wubQ0d5FWcIxE
	KxThuy3tiU6i2Z6sxjiobFUet3zcGlEoPxsrOTJNbq8qws7i6wDhDyr+yurqN1mOtyFz
	JJ1CJOWKI93TsmH+KTao0xtow8lbu7rPfNfXChdR31n8Zw0ac8+V9nldXS6f8VnpQXOz
	msHQ==
X-Gm-Message-State: APjAAAUknRU6R2HFqiPxn6XbZUFLj5LCxIahBlL7OBZjNSm+Q+1uSXeP
	a9WxJaA6eiUtDFYGF36LDdnsgQ==
X-Google-Smtp-Source: APXvYqyqCUWNrulWGef0LUT6NzGpufF43GtmCZ0T464ifMGnQtfYAJyCFq+YuD2cHubsD+/xy7fogA==
X-Received: by 2002:a54:450f:: with SMTP id l15mr4329347oil.126.1581624929563; 
	Thu, 13 Feb 2020 12:15:29 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:18f0:30d2:de29:e134?
	([2600:1700:4c90:60a0:18f0:30d2:de29:e134])
	by smtp.gmail.com with ESMTPSA id f1sm1144892otq.4.2020.02.13.12.15.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Feb 2020 12:15:29 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	richard.leitner@skidata.com
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <22639ede-b55a-3e33-3ac3-c462b1e37b62@mvista.com>
Date: Thu, 13 Feb 2020 12:15:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
Subject: Cherry pick patches breaking zeus/thud/master.
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
X-List-Received-Date: Thu, 13 Feb 2020 20:15:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Richard,

Is it possible to cherry pick

d0a9fe08be6e1c2e7f7afc79abc292d3bffeb9fe
Revert "openjdk-8: disable, stringop-overflow compiler errors"

to zeus/thud/master, since they are breaking for the same reason as warrior?

TIA

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


