Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1J9hNM-0000JE-2G
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 14:41:48 +0100
Received: by py-out-1112.google.com with SMTP id y77so1079149pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2008 05:35:30 -0800 (PST)
Received: by 10.65.224.11 with SMTP id b11mr27048841qbr.93.1199194529924;
	Tue, 01 Jan 2008 05:35:29 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id 40sm11804873nzf.1.2008.01.01.05.35.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jan 2008 05:35:28 -0800 (PST)
Message-ID: <477A417C.2000105@gmail.com>
Date: Tue, 01 Jan 2008 07:34:52 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <4774C182.20501@gmail.com> <4774C9AA.8050705@student.utwente.nl>
	<4774F459.5010100@laposte.net>
In-Reply-To: <4774F459.5010100@laposte.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Tosa kernel bloat
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jan 2008 13:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2007 07:04 AM, cyril Romain wrote:
> Koen Kooi wrote:
>> Junqian Gordon Xu schreef:
>>> Tosa kernel is bloated with the recent patch and change to
>> defconfig-tosa
>>
>> Is that also the case in the angstrom stable branch?
> Yes.
> This is the case for linux-rp-2.6.23-r12 (angstrom stable branch) and
> linux-rp-2.6.23-r14: (angstrom dev branch)
> The tosa kernel compiled fine with linux-rp-2.6.23-r10 (metadata from
> december, 8th)

Since there is little to trim down for tosa kernel (WM9712 and tosa_ts 
are possible targets, but need to patch kernel to make those 
modularizable). The only option for now is to disable KEXEC and ATAGS. 
Please review the patch for both stable and dev.

Regards
Gordon

# old_revision [93692aaac63b82b355275bee987480a1232079a1]
#
# patch "packages/linux/linux-rp-2.6.23/defconfig-tosa"
#  from [1980d93e930a1fd5959d13384211a7f445751136]
#    to [f7677a83e981b7570f63b19ba6fde79500d32e64]
#
============================================================
--- packages/linux/linux-rp-2.6.23/defconfig-tosa 
1980d93e930a1fd5959d13384211a7f445751136
+++ packages/linux/linux-rp-2.6.23/defconfig-tosa 
f7677a83e981b7570f63b19ba6fde79500d32e64
@@ -142,8 +142,8 @@ CONFIG_XSCALE_PMU=y
  #
  CONFIG_ARM_THUMB=y
  CONFIG_XSCALE_PMU=y
-CONFIG_KEXEC=y
-CONFIG_ATAGS_PROC=y
+# CONFIG_KEXEC is not set
+# CONFIG_ATAGS_PROC is not set
  CONFIG_SHARP_PARAM=y
  CONFIG_SHARPSL_PM=y
  CONFIG_SHARP_SCOOP=y


