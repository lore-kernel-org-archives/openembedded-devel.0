Return-Path: <prvs=744399394=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 53AD760125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:46:05 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqsEALRcO1asEApK/2dsb2JhbABehQO5L4I6hAaDPoJUAoF6AQEBAQEBgQuELggBAQR4EQsNCwkWDwkDAgECAUUGDQgChUWCasIAAQEBBwIhhlSEfoUnhBIBBIZhj2eWPheTEIRohQmBBwEBAQ
X-IPAS-Result: AqsEALRcO1asEApK/2dsb2JhbABehQO5L4I6hAaDPoJUAoF6AQEBAQEBgQuELggBAQR4EQsNCwkWDwkDAgECAUUGDQgChUWCasIAAQEBBwIhhlSEfoUnhBIBBIZhj2eWPheTEIRohQmBBwEBAQ
Message-ID: <563B5D58.6070709@skidata.com>
Date: Thu, 5 Nov 2015 14:44:56 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
	<5638D571.3090500@skidata.com>
	<7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
	<5639BBD0.2050201@skidata.com>
	<F46AA2E3-B76D-4B6D-ABC9-2423E80EA882@gmail.com>
In-Reply-To: <F46AA2E3-B76D-4B6D-ABC9-2423E80EA882@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 05 Nov 2015 13:46:05 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/04/2015 06:57 PM, Jens Rehsack wrote:
> Sure? Didn't you "bitbake openjdk-8"? Or is it because virtual/javac-native now points
> to openjdk-8-native and there is no known way for me to let a user sanely pick the
> beloved one on his/her own?
> 
> But openjdk-7 should not depend on virtual/javac-native -- so some enlightening is
> required ...

I'm sure I built openjdk-7 ;-)

Following PREFERRED_PROVIDES were defined:
PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"

Any idea?

kind regards,
Richard L

