Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5137D70373
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 10:05:19 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so5686381lab.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=GpEZebutmU6Q/Wo+LK1tuf4QJDSZa1y+IExuV+KRaCg=;
	b=Ms7R/LUqqrtZrFD79wfZuAXIN9DFpb4URotvNO4c3E8syo40CrkBlEBwUj77UAOSu9
	GV+WczgizRMnVHe83M00TZd48pnac90OB36K7Yit1ZvI/oDs3jx4NV1AoWpu/iqlSdHK
	TrFd/wxw2eldJtxuSe1bB5clwWjc9dfFgHKU63RN+erwjOozeItcP0Ens4p22Fc9nkRQ
	UBTlBnq5ZwQ0m1NKMrDBbvj137NwybpND6IZStzI1qeEH2kG2YzZLF9XfysD+L6Qjl5Q
	kAZ9iHgzCbL0jUkma91zHzxvtT69LlSYfKdYqqPlAZENWkNB6KQCoIjnLDIAKmzvdk7v
	eNMQ==
X-Gm-Message-State: ALoCoQlwYUjw3ryfvEyXJl0PiZlAXgq9mlx5Ev8ETVk3N7kIYgfkHTHLDbMpjT8i9n8BOVkD0x1V
X-Received: by 10.112.169.35 with SMTP id ab3mr33051539lbc.41.1408442719881;
	Tue, 19 Aug 2014 03:05:19 -0700 (PDT)
Received: from [192.168.1.120] ([188.92.105.210])
	by mx.google.com with ESMTPSA id m1sm12216533laj.6.2014.08.19.03.05.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Aug 2014 03:05:18 -0700 (PDT)
Message-ID: <53F3215D.6000407@linaro.org>
Date: Tue, 19 Aug 2014 14:05:17 +0400
From: Maxim Uvarov <maxim.uvarov@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: wget --content-disposition flag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Aug 2014 10:05:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

can we add by default wget --content-disposition flag? Github has 
releases feature and creates tarball for certain git tag. And tarball 
file name is for example v1.tar.gz.  But for html content right name can 
be used i.e. project-name-v1.tar.gz.

If it's possible to add this flag wget will downloads files to right 
file names:

Example:
wget --content-disposition 
https://github.com/muvarov/daq-odp/archive/v0.1.tar.gz

Thank you,
Maxim.

