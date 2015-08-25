Return-Path: <prvs=672648817=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D3FF573E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:47:18 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEAOsO3FWsEApK/2dsb2JhbABdhFgGxXYCgXoBAQEBAQGBC4QkAQEEMgFFEQsNCwkWDwkDAgECAUUGDQYCAogvxzABAQgii1eFEYQsAQSVNJVlF5FFhCZvgUiBBAEBAQ
X-IPAS-Result: ApwEAOsO3FWsEApK/2dsb2JhbABdhFgGxXYCgXoBAQEBAQGBC4QkAQEEMgFFEQsNCwkWDwkDAgECAUUGDQYCAogvxzABAQgii1eFEYQsAQSVNJVlF5FFhCZvgUiBBAEBAQ
Message-ID: <55DC0F56.6040204@skidata.com>
Date: Tue, 25 Aug 2015 08:46:46 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
	<55D580DA.7080004@skidata.com>
	<FA6D4712-DD99-40AC-8393-136CDA3CDDD8@gmail.com>
In-Reply-To: <FA6D4712-DD99-40AC-8393-136CDA3CDDD8@gmail.com>
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
X-List-Received-Date: Tue, 25 Aug 2015 06:47:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit


On 08/25/2015 08:38 AM, Khem Raj wrote:
> 
>> On Aug 20, 2015, at 12:25 AM, Richard Leitner <richard.leitner@skidata.com> wrote:
>>
>> Hi,
>>
>> On 08/19/2015 01:53 PM, Sven Ebenfeld wrote:
>>> This patch creates a circular dependency for me:
>>>
>>> ERROR: Unbuildable tasks were found.
>>> These are usually caused by circular dependencies and any circular
>>> dependency chains found will be printed below. Increase the debug
>>> level to see a list of unbuildable tasks.
>>>
>>
>> Same problem for me!
>>
>> My settings are:
>> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
>> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
>> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native”
> 
> can you change this to
> 
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-initial-native"
> 
> and retry ?

Same problem:

NOTE: Preparing runqueue
ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular
dependency chains found will be printed below. Increase the debug level
to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task 674
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
  Task 675
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
do_install'])
  Task 684
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_configure) (dependent Tasks ['gnu-config, do_populate_sysroot',
'autoconf, do_populate_sysroot', 'zlib, do_populate_sysroot', 'libffi,
do_populate_sysroot', 'jamvm, do_patch', 'automake,
do_populate_sysroot', 'libtool-native, do_populate_sysroot',
'classpath-native, do_populate_sysroot', 'ecj-bootstrap-native.bb,
do_populate_sysroot', 'pkgconfig, do_populate_sysroot'])
  Task 685
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_compile) (dependent Tasks ['jamvm, do_configure'])
  Task 681
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_install) (dependent Tasks ['jamvm, do_compile'])
  Task 682
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
  Task 677
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_configure) (dependent Tasks ['ecj-bootstrap-native.bb, do_patch',
'jamvm, do_populate_sysroot', 'libecj-bootstrap-native,
do_populate_sysroot'])
  Task 678
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_compile) (dependent Tasks ['ecj-bootstrap-native.bb, do_configure'])



Dependency loop #2 found:
  Task 674
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
  Task 675
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
do_install'])
  Task 691
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb,
do_configure) (dependent Tasks ['zip, do_populate_sysroot', 'gnu-config,
do_populate_sysroot', 'autoconf, do_populate_sysroot',
'ecj-bootstrap-native.bb, do_populate_sysroot', 'automake,
do_populate_sysroot', 'classpath-native, do_patch', 'libtool-native,
do_populate_sysroot', 'fastjar, do_populate_sysroot',
'gettext-minimal-native, do_populate_sysroot'])
  Task 692
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb,
do_compile) (dependent Tasks ['classpath-native, do_configure'])
  Task 688
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb,
do_install) (dependent Tasks ['classpath-native, do_compile'])
  Task 689
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb,
do_populate_sysroot) (dependent Tasks ['classpath-native, do_install'])
  Task 684
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_configure) (dependent Tasks ['gnu-config, do_populate_sysroot',
'autoconf, do_populate_sysroot', 'zlib, do_populate_sysroot', 'libffi,
do_populate_sysroot', 'jamvm, do_patch', 'automake,
do_populate_sysroot', 'libtool-native, do_populate_sysroot',
'classpath-native, do_populate_sysroot', 'ecj-bootstrap-native.bb,
do_populate_sysroot', 'pkgconfig, do_populate_sysroot'])
  Task 685
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_compile) (dependent Tasks ['jamvm, do_configure'])
  Task 681
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_install) (dependent Tasks ['jamvm, do_compile'])
  Task 682
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,
do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
  Task 677
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_configure) (dependent Tasks ['ecj-bootstrap-native.bb, do_patch',
'jamvm, do_populate_sysroot', 'libecj-bootstrap-native,
do_populate_sysroot'])
  Task 678
(/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_compile) (dependent Tasks ['ecj-bootstrap-native.bb, do_configure'])



