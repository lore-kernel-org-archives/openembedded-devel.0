Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id E5D51601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 11:28:27 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id 8bUR1p00R0BVjqb01bUSQ6; Tue, 28 Oct 2014 04:28:26 -0700
Message-ID: <544F7DD9.9060702@pabigot.com>
Date: Tue, 28 Oct 2014 06:28:25 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
	<m2nubm$sph$1@ger.gmane.org>
In-Reply-To: <m2nubm$sph$1@ger.gmane.org>
Subject: Re: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
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
X-List-Received-Date: Tue, 28 Oct 2014 11:28:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2014 06:23 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Qi.Chen@windriver.com schreef op 28-10-14 04:27:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Fix the service so that the ntpd daemon is run under ntp:ntp.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com> ---
>> meta-networking/recipes-support/ntp/ntp/ntpd.service | 2 +- 1 file
>> changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service
>> b/meta-networking/recipes-support/ntp/ntp/ntpd.service index
>> b7c4268..0e3d7cd 100644 ---
>> a/meta-networking/recipes-support/ntp/ntp/ntpd.service +++
>> b/meta-networking/recipes-support/ntp/ntp/ntpd.service @@ -5,7 +5,7 @@
>> After=network.target [Service] Type=forking PIDFile=/run/ntpd.pid
>> -ExecStart=/usr/sbin/ntpd -p /run/ntpd.pid -g +ExecStart=/usr/sbin/ntpd
>> -u ntp:ntp -p /run/ntpd.pid -g
> Wouldn't User=ntp be a better approach, or does ntp need more priviliges
> during startup before dropping then and su'ing?

If kernel PPS is enabled (which it is by default), ntp does need 
additional privileges during startup.

Peter

