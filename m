Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RTZl8-0006lO-BD
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 14:54:38 +0100
Received: by faat2 with SMTP id t2so2968249faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=wI4wvQIKokuE3Xsc0A+YxbvoNIcCJgLntV1t+q3hjGA=;
	b=A8mlFv60SyyQWdc1ZqLrnOQ4qeC8n+kfGg1euG7bX0/BONX5lz0Y1NHpTvNVRc6fIK
	3il1KEHZtIh45H/YFgmBPS9Y08eo54Or7qMxAReQYOrL5yMMmzwcQ01MRM5VIKmINd4X
	/Ul07tT9yn7SM/fnwuptHS0UPLeiFob99Pgg8=
Received: by 10.204.13.78 with SMTP id b14mr15254945bka.23.1322142484598;
	Thu, 24 Nov 2011 05:48:04 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id hw14sm2906130bkc.16.2011.11.24.05.48.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 05:48:02 -0800 (PST)
Message-ID: <4ECE4B0D.6030401@googlemail.com>
Date: Thu, 24 Nov 2011 13:47:57 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
In-Reply-To: <CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
Subject: Re: "cannot find -lppl_c" link error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 13:54:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> It looks as though ld cannot find "ppl_c" (not ppl!). What is ppl_c? The build environment I use is x86_64 (quad core CPU), running heavily upgraded and updated FC13 (most of the components are based on FC14 & FC15). The target device is htcdream (ARMv6).
>>
>> Any idea what is causing this?
>>     
>
> somehow gcc build is detecting that you have enabled PPL support, I
> dont think we either enable or disable it by default.
I think this is a necessity for building gcc as it needs ppl, 
cloog(-ppl) among other core libraries. As far as I know I can't just 
"disable it".

>  So I think your
> build system has the header file ppl_c.h installed but library itself
> is not installed.
I take it you mean ppl on my host arch (x86_64 in my case). if so:

[root@test1 ~]# rpm -qa | grep ppl
cloog-ppl-0.15.7-1.fc12.x86_64
ppl-devel-0.10.2-10.fc12.x86_64
ppl-0.10.2-10.fc12.x86_64
cloog-ppl-devel-0.15.7-1.fc12.x86_64
[root@test1 ~]# ls -las /usr/lib64/libppl*
   0 lrwxrwxrwx. 1 root root      17 Nov 25  2010 /usr/lib64/libppl_c.so 
-> libppl_c.so.2.1.0
   0 lrwxrwxrwx. 1 root root      17 Jun 17  2010 
/usr/lib64/libppl_c.so.2 -> libppl_c.so.2.1.0
3496 -rwxr-xr-x. 1 root root 3579376 Sep 11  2009 
/usr/lib64/libppl_c.so.2.1.0
   0 lrwxrwxrwx. 1 root root      15 Nov 25  2010 /usr/lib64/libppl.so 
-> libppl.so.7.1.0
   0 lrwxrwxrwx. 1 root root      15 Jun 17  2010 /usr/lib64/libppl.so.7 
-> libppl.so.7.1.0
 756 -rwxr-xr-x. 1 root root  772032 Sep 11  2009 /usr/lib64/libppl.so.7.1.0
[root@test1 ~]# ls -las /usr/include/ppl*
   4 -rw-r--r--. 1 root root    1676 Sep 11  2009 /usr/include/ppl_c.h
 364 -rw-r--r--. 1 root root  370045 Sep 11  2009 
/usr/include/ppl_c-x86_64.h
   4 -rw-r--r--. 1 root root    1676 Sep 11  2009 /usr/include/ppl.hh
2340 -rw-r--r--. 1 root root 2394720 Sep 11  2009 /usr/include/ppl-x86_64.hh

As you can see, I have all of the above and the appropriate libppl_c 
files are where they should be.

>  If you remove ppl installation from your build host
> it would work and if you install the ppl packages propertly it should
> work too.
>   
No, it won't! As I stated above gcc depends on these libraries so I 
can't just remove them:

[root@test1 ~]# rpm --erase --test ppl ppl-devel cloog-ppl cloog-ppl-devel
error: Failed dependencies:
    cloog-ppl >= 0.15 is needed by (installed) gcc-4.4.5-2.fc13.x86_64
[root@test1 ~]# rpm --erase --test ppl ppl-devel                         
error: Failed dependencies:
    libppl.so.7()(64bit) is needed by (installed) 
cloog-ppl-0.15.7-1.fc12.x86_64
    libppl_c.so.2()(64bit) is needed by (installed) 
cloog-ppl-0.15.7-1.fc12.x86_64
    ppl-devel >= 0.10 is needed by (installed) 
cloog-ppl-devel-0.15.7-1.fc12.x86_64

Any ideas why OE can't find my ppl_c libs?


