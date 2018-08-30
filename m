Return-Path: <oterenti@cisco.com>
X-Greylist: delayed 731 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Aug 2018 14:27:26 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C59A793EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=678; q=dns/txt; s=iport;
	t=1535639248; x=1536848848;
	h=from:subject:to:cc:message-id:date:mime-version:
	content-transfer-encoding;
	bh=hACCkC3YmwW4IUd1NBhR4WcprLHJz7wqtQ/NPyP/pxw=;
	b=Na5FLpIA3zyulQIR1lxvSlLcuJYlqbPJSJqomH4xUVfjvpZKpkKFMENa
	5txssv3H60JCq4HKsEcp6G/SiHYjFeMnjis+iACYRv0uJlAq4wkg8WsiV
	Q+lRjIruO8Lz+C2glcQtyyxycGVvJUFz59t1MBR8AB69lQ7l/StBrIrOG Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D9AQCJ+4db/xbLJq1aGgEBAQEBAgE?=
	=?us-ascii?q?BAQEIAQEBAYQ0bRKEGohwjSyJDY9DCyeERYNEOBQBAgEBAgEBAm0cDIU5BCQ?=
	=?us-ascii?q?PAQVBBTACJgJgDAgBAYMdAYF0BQgPoziBLoRrhRwUd4NehT+BQT+BOYpqglc?=
	=?us-ascii?q?CjhKNKwmGM4k8BheBMVaGQ4YIiySIDgIECwIUgVghJoEsTSMVgyUICYsDhUE?=
	=?us-ascii?q?8jVwBAQ?=
X-IronPort-AV: E=Sophos;i="5.53,307,1531785600"; 
   d="scan'208";a="6218843"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2018 14:14:58 +0000
Received: from [10.61.217.217] ([10.61.217.217]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w7UEER6U024735
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 30 Aug 2018 14:14:57 GMT
From: Oleksandr Terentiev <oterenti@cisco.com>
To: openembedded-devel@lists.openembedded.org, Mingli.Yu@windriver.com,
	akuster808@gmail.com
Message-ID: <fc6a9148-ca04-de42-f7fb-70d736561b94@cisco.com>
Date: Thu, 30 Aug 2018 17:14:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: oterenti
X-Outbound-SMTP-Client: 10.61.217.217, [10.61.217.217]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: protobuf: question about ptest
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
X-List-Received-Date: Thu, 30 Aug 2018 14:27:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

Recently I tried to launch ptests for protobuf packet and it looks like 
tests themselves need interaction with a user.
Here is an output when I run /usr/lib/protobuf/ptest/run-ptest

> root@qemux86:~# /usr/lib64/protobuf/ptest/run-ptest
> Generating new test file using add_person_cpp...
> /tmp/test.data: File not found.  Creating a new file.
> Enter person ID number:

I looked at run-ptest script
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
And it seems doesn't implement user interaction as protobuf tests require.
So what is the best way to automate those tests?

Thanks,
Alex Terentiev


