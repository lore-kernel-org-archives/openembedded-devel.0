Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.86])
 by mx.groups.io with SMTP id smtpd.web12.7181.1592399568046968083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OExA/4qT;
 spf=pass (domain: windriver.com, ip: 40.107.92.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpbODgWy0kmgN6OcxFcra3r3yWcOlL+6AD3APhPlfPI0D+JXo4XGqISlvk5DRdjaZxkhBAWnY4gBAiC200pEwhKFedjma4RVQppx8VB7baKuzB7Tc4upuHOgP8NRh/6Zc7/Vuvle9uMU3xMlOXQT5CWAEr0t4nBFIy4he6rYHcGg+8Z2aWXRJmRqK7Ej8JjNUEumY2FSWVQaaelGtrEqusAdTVL6zFx6zIWpMWcUwlLykTOgkM4J2d+NJhSOK0fW2yCFEON2dEsqVPou8D+mnms18anJMDdHQhuKzeqZA9eNoAnk/QvqzwDQzPv9t9uDUCu80KwTHo5fpkH/I90JRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jc/fLB4mrLto7W5xIwE80GJfDY2uy8yeAEjUJXITVg=;
 b=g8lmfpvuh+BK6nUDFpJm78aj752g120wQ2ofDxlfjV9GPuCco9ZSTxzru0Egrh8uMy27t1cAhiLeEAEKUUsNAK/U2LEz+poQdVS1SReLwE3KNbNRSoE4oE+vghqc8+p2fDlx9U7rsqIDGIcwu6/IsQCEsIZmAJ1HjeSXNsXaLMKutIOjqh/O+GMNqxvCz4OLaMs1H/nPYzBzzvL8NFlARZcVlrkgx5ZfFahqT/cYKA2+UAp3oTlgv5me9YJMObmYzgkUN+BN4K98QnrmrJVjswBj/u5wVq2KF/P7z3BqdNAyRccbsKiMrYWlk3K1HaVVjL/vIMFwyb4fXkijKc9m+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jc/fLB4mrLto7W5xIwE80GJfDY2uy8yeAEjUJXITVg=;
 b=OExA/4qTr/paJqvXfKnJQrE3Duiajn7c6BDFTRlMnmIeKfNkQCmdG7teYV24/u9EWOSqPGBFHayI/cKfZaxSgREbr1rW4GO3EcTeMVFEwwTztssQ26ZBdVjqB7a8fdtRdw8bwl1z5mK0SH6a/uTjt/ERYS025ZZENQqvfk027BI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 13:12:46 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:12:46 +0000
Subject: Re: [oe] [meta-oe][PATCH] protobuf: Upgrade 3.11.4 -> 3.12.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615124132.5262-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b197aba7-c2aa-1d6e-35d6-be2b41b2c698@windriver.com>
Date: Wed, 17 Jun 2020 09:12:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615124132.5262-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 13:12:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43c2fc8-ef0e-4297-2c38-08d812c02047
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1873C052C09E540FD705EB959F9A0@BN6PR11MB1873.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V2caMccsYC4I3hCMY+x2PXEdF9F4atvzY0KjYdkifddaJq8BMiI0XlOtU90hGxZj64fAFGr8m460Zf70BpYKVCM67Bfn8gwGkkqNjgxrbPMA36vBDozMUcfYlkMn9+/traqC3kklClhuFSRYNqgMX/YcG4IJdJVntuDvVHNjxrTqUZXjX+lcjFDMTdJ8FTbiUdBj2i5csfcJAjWR2JKYf422QjXzh5AsqJGMXWgeFD2QAX6VcTwy/ud+99GonwGsLS8xCE5bZ1CjmW8MBZKPJV7ii9M8GNLuNRp7wJr4vGbfDwIhAtUSnIsrB//6LpehDt8SZfpq9+7gVRYEtCTaeRnVA+yu3veOW3mLqw0iM/ZhupwjBKhYjLVM0O6SslGNnP1Z0MNUa9HAzenDUouciHhUvHS3bPhGIKzguaR37kdn2hJppIiC4y33ItlHJq2gzKeZScuAJdYj/fQVi86amg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39850400004)(346002)(366004)(136003)(396003)(66946007)(31696002)(66476007)(186003)(478600001)(86362001)(6486002)(16526019)(26005)(5660300002)(66556008)(8676002)(83380400001)(8936002)(966005)(16576012)(52116002)(2906002)(2616005)(44832011)(956004)(316002)(33964004)(53546011)(36756003)(166002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jNcbkarb0fxF2+KYZjWfOXarHD6QDvyNpoy/OmYX2KQVX6lDsjERcaJYG1DDbsygh27b9xoXJcqjAQ2+61eiMLN0gK293MXIeqUDsjLlkRJz8y7o/6tP++1HLfSvqOqvwiiP7ePrX98Zjd32Q6yUrz51xX6SziDnmnsDyS9+eKMIOrDklCUOo9MD/jO/cDhMiutdUlHX804woMHsyCEpZMQp2rBmxMpFIOe9+SHGp2xhu14eBk5memQOl7ak1ZIxk+NSSnFFmLHUZYOIz9ugDzSK9zwqjbKhjsmQsWXu89kr0dwdyc5pMjM2stzzqaz69t7Uxq/hHNSIk5/KlmyMagNzObUqGfXN40IWjt7aAjCXwJUiPAQ2oR2kKtAO4SNkY8L7/tHCEHpVry/lNhZGZwq0w5lDC9vkpbhNwY6pELxJxK/28wxszRpSVK8q+LdFYLl+l9f4at/0hYT7FnwpW9tdcyuqqoNAikRjcA9tfLarmPFypbiPcTmQubIJZc8v
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43c2fc8-ef0e-4297-2c38-08d812c02047
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:12:45.9966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLwlYpDjuZr7EwjrD0sHBCukxpIQsS1uoGajisT3SDr3+T5oVXdyn1nDtxsGlt+Yj2ENmRxcaJskD1JNLoZ2+ZIGSLPYdHsJTGcNh8u9ARk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
Content-Type: multipart/alternative;
 boundary="------------857C463BC88884D460A7D4D1"
Content-Language: en-US

--------------857C463BC88884D460A7D4D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 8:41 AM, Leon Anavi wrote:
> Upgrade to release 3.12.3. Update the path to the git repository
> in GitHub. Update the patch for examples/Makefile.
>
> The new release brings:
>
> - [experimental] Singular, non-message typed fields in proto3 now
>    support presence tracking. This is enabled by adding the
>    "optional" field label and passing the
>    --experimental_allow_proto3_optional flag to protoc.
> - Allow duplicate symbol names when multiple descriptor sets are
>    passed on the command-line, to match the behavior when multiple
>    .proto files are passed.
> - Deterministic protoc --descriptor_set_out
> - Bug fixes for the supported programming languages
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 12 ++++++++----
>   .../{protobuf_3.11.4.bb => protobuf_3.12.3.bb}       |  4 ++--
>   2 files changed, 10 insertions(+), 6 deletions(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.11.4.bb => protobuf_3.12.3.bb} (96%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> index 0a2e5e2df..934c98193 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,4 +1,4 @@
> -From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
> +From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
>   From: Martin Jansa <Martin.Jansa@gmail.com>
>   Date: Fri, 28 Jun 2019 13:50:52 +0000
>   Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
> @@ -23,12 +23,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
>   
>   Upstream-Status: Pending
>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    examples/Makefile | 6 ++++--
>    1 file changed, 4 insertions(+), 2 deletions(-)
>   
>   diff --git a/examples/Makefile b/examples/Makefile
> -index 4ad605641..31d887639 100644
> +index e9f9635ae..b2fbe2de1 100644
>   --- a/examples/Makefile
>   +++ b/examples/Makefile
>   @@ -2,6 +2,8 @@
> @@ -44,13 +45,16 @@ index 4ad605641..31d887639 100644
>    
>    add_person_cpp: add_person.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
> +-	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>   +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>    
>    list_people_cpp: list_people.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
> +-	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
>   +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>    
>    add_person_dart: add_person.dart protoc_middleman_dart
>    
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> similarity index 96%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> index 4d6c5b255..21ad7a460 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>   DEPENDS = "zlib"
>   DEPENDS_append_class-target = " protobuf-native"
>   
> -SRCREV = "d0bfd5221182da1a7cc280f3337b5e41a89539cf"
> +SRCREV = "31ebe2ac71400344a5db91ffc13c4ddfb7589f92"
>   
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x \
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
>              file://run-ptest \
>              file://0001-protobuf-fix-configure-error.patch \
>              file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
>
> 

--------------857C463BC88884D460A7D4D1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 8:41 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615124132.5262-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.12.3. Update the path to the git repository
in GitHub. Update the patch for examples/Makefile.

The new release brings:

- [experimental] Singular, non-message typed fields in proto3 now
  support presence tracking. This is enabled by adding the
  &quot;optional&quot; field label and passing the
  --experimental_allow_proto3_optional flag to protoc.
- Allow duplicate symbol names when multiple descriptor sets are
  passed on the command-line, to match the behavior when multiple
  .proto files are passed.
- Deterministic protoc --descriptor_set_out
- Bug fixes for the supported programming languages

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615124132.5262-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----
 .../{protobuf_3.11.4.bb =&gt; protobuf_3.12.3.bb}       |  4 &#43;&#43;--
 2 files changed, 10 insertions(&#43;), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.11.4.bb =&gt; protobuf_3.12.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 0a2e5e2df..934c98193 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
&#43;&#43;&#43; b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,4 &#43;1,4 @@
-From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
&#43;From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
 Date: Fri, 28 Jun 2019 13:50:52 &#43;0000
 Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
@@ -23,12 &#43;23,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
 
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
&#43;Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  examples/Makefile | 6 &#43;&#43;&#43;&#43;--
  1 file changed, 4 insertions(&#43;), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 4ad605641..31d887639 100644
&#43;index e9f9635ae..b2fbe2de1 100644
 --- a/examples/Makefile
 &#43;&#43;&#43; b/examples/Makefile
 @@ -2,6 &#43;2,8 @@
@@ -44,13 &#43;45,16 @@ index 4ad605641..31d887639 100644
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c&#43;&#43; add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
&#43;-	c&#43;&#43; -std=c&#43;&#43;11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
 &#43;	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c&#43;&#43; list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
&#43;-	c&#43;&#43; -std=c&#43;&#43;11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
 &#43;	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
&#43;-- 
&#43;2.17.1
&#43;
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
index 4d6c5b255..21ad7a460 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
&#43;&#43;&#43; b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
@@ -10,9 &#43;10,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b">&quot;file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b&quot;</a>
 DEPENDS = &quot;zlib&quot;
 DEPENDS_append_class-target = &quot; protobuf-native&quot;
 
-SRCREV = &quot;d0bfd5221182da1a7cc280f3337b5e41a89539cf&quot;
&#43;SRCREV = &quot;31ebe2ac71400344a5db91ffc13c4ddfb7589f92&quot;
 
-SRC_URI = &quot;git://github.com/google/protobuf.git;branch=3.11.x \
&#43;SRC_URI = &quot;git://github.com/protocolbuffers/protobuf.git \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
            <a class="moz-txt-link-freetext" href="file://0001-protobuf-fix-configure-error.patch">file://0001-protobuf-fix-configure-error.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch">file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------857C463BC88884D460A7D4D1--
