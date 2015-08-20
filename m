Return-Path: <prvs=667765fcb=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2D86873E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:25:45 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AiIFAGSA1VWsEApK/2dsb2JhbABdhF6DH79tglgCgXoBAQEBAQGBC4QkAQEEIw8BRRELDQsCAgUWCwICCQMCAQIBNRAGDQgCiC+5HpYEAQEIIoEiijGFEReCUoFDAQSSF4MRlWAXkTKEJYI3gQQBAQE
X-IPAS-Result: AiIFAGSA1VWsEApK/2dsb2JhbABdhF6DH79tglgCgXoBAQEBAQGBC4QkAQEEIw8BRRELDQsCAgUWCwICCQMCAQIBNRAGDQgCiC+5HpYEAQEIIoEiijGFEReCUoFDAQSSF4MRlWAXkTKEJYI3gQQBAQE
Message-ID: <55D580DA.7080004@skidata.com>
Date: Thu, 20 Aug 2015 09:25:14 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
In-Reply-To: <CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 1/3] Don't depend on a hardcoded compiler
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
X-List-Received-Date: Thu, 20 Aug 2015 07:25:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On 08/19/2015 01:53 PM, Sven Ebenfeld wrote:
> This patch creates a circular dependency for me:
> 
> ERROR: Unbuildable tasks were found.
> These are usually caused by circular dependencies and any circular
> dependency chains found will be printed below. Increase the debug
> level to see a list of unbuildable tasks.
> 

Same problem for me!

My settings are:
PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_VERSION_openjdk-7-jre = "85b01-2.6.1"
PREFERRED_VERSION_icedtea7-native = "2.1.3"
PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"

If I revert the "Don't depend on a hardcoded compiler" patch the build
starts successfully!

regards,
Richard L

