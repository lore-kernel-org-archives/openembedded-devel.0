Return-Path: <prvs=7372357f8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id C737E73CC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:32:56 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqoEALHmMVasEApK/2dsb2JhbABehHkGunSGCYYbAoF7AQEBAQEBgQuENgEBBDIBRRELDQsJFgQLCQMCAQIBRQYNBgICiDHFLAEBCAIhhneEfoUXF4QXAQSWQpY+F5MEgyeBQXGEd4EGAQEB
X-IPAS-Result: AqoEALHmMVasEApK/2dsb2JhbABehHkGunSGCYYbAoF7AQEBAQEBgQuENgEBBDIBRRELDQsJFgQLCQMCAQIBRQYNBgICiDHFLAEBCAIhhneEfoUXF4QXAQSWQpY+F5MEgyeBQXGEd4EGAQEB
Message-ID: <5631E78F.8030300@skidata.com>
Date: Thu, 29 Oct 2015 10:31:59 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <C0C9437F-FD83-4433-A8C9-8B8CDD366097@gmail.com>
In-Reply-To: <C0C9437F-FD83-4433-A8C9-8B8CDD366097@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 1/4] Avoid parse time errors due to dependency on x11, for distros without x11
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
X-List-Received-Date: Thu, 29 Oct 2015 09:32:58 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 10/28/2015 06:58 PM, Jens Rehsack wrote:
> 
> BitBake raises some errors when processing recipes that depend on x11
> for distros that don't have x11 in DISTRO_FEATURES. To work around
> that issue, REQUIRED_DISTRO_FEATURES = "x11" (from
> distro_features_check.bbclass) has been set for the following recipes:
> 
> * cacao (_class-target)
> * classpath (_class-target)
> * jamvm (_class-target)
> * openjdk-7-release
> 
> That makes BitBake skip those recipes during the cache generation
> (they'd still be parsed, but ignored).
> 
> This patch improves the idea from Mario Domenech Goulart <mario@ossystems.com.br>
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

Successfully tested this patch with OpenJDK 7u91b01 for a ARM Cortex A9
target with VFP & X11.

So feel free to add
Acked-by: Richard Leitner <richard.leitner@skidata.com>

