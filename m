Received: from mail-qc0-f171.google.com ([209.85.216.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1USX1X-0001as-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 20:24:27 +0200
Received: by mail-qc0-f171.google.com with SMTP id q2so846559qch.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:references:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=h2kaxPLmmIJxatTMZuzoqTi4cmpqN3TkvWr7tvjtDvw=;
	b=yNPy+IbSlMkcvBVyWYrWEg/5140FopeuhaRxJCHB5oR0ha+NJ7c2PLXKDfzZX4e2QO
	IWoHXvnDc2fSaL+x5sMQBCgxA8EVsYuRMKz5NDqjMz6yLuSAXPWYcUHba3C3beMiHsid
	LaPZXxsNBipTI8c67b3JxLo//t7PxRkQSxDBt5u39A6I3RdohB74tFQaiGEvE/81l/mC
	yvXsbrbrmLPVrki9zVF6Qr7kZQVJ6El6mjoEezSOcdplsaFcfrxgGGim+LwixQNS8U7Z
	7YxF+JUXLVpPL+mlGPZ5Ql15w4g/JTsconsxDtmmkFnQJXXNGK/oQokSIt8QoKFTGC9G
	lH6A==
X-Received: by 10.224.221.81 with SMTP id ib17mr7469018qab.62.1366221990926;
	Wed, 17 Apr 2013 11:06:30 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id kf2sm7720284qeb.4.2013.04.17.11.06.29
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 11:06:30 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
	<20130417120420.GG26007@jama>
Date: Wed, 17 Apr 2013 14:06:01 -0400
In-Reply-To: <20130417120420.GG26007@jama> (Martin Jansa's message of "Wed, 17
	Apr 2013 14:04:20 +0200")
Message-ID: <85sj2pjaly.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH 1/2] libgsf: update to version 1.14.26
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
X-List-Received-Date: Wed, 17 Apr 2013 18:24:38 -0000
Content-Type: text/plain

On Wed, 17 Apr 2013 14:04:20 +0200 Martin Jansa <martin.jansa@gmail.com> wrote:

> On Sat, Apr 13, 2013 at 02:15:00PM -0300, Otavio Salvador wrote:
>> From: Mario Domenech Goulart <mario@ossystems.com.br>
>> 
>> Previous version was 1.14.21, but Gnumeric requires at least 1.14.24.
>> Since we are changing it, we pick the latest available version.
>> 
>> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../recipes-gnome/libgsf/{libgsf_1.14.21.bb => libgsf_1.14.26.bb} | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.21.bb => libgsf_1.14.26.bb} (71%)
>> 
>> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
>> similarity index 71%
>> rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
>> rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
>> index a4f1ec2..a6127d6 100644
>> --- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
>> +++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
>> @@ -3,16 +3,16 @@ LICENSE = "GPLv2 & LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
>>                      file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
>>  
>> -PR = "r4"
>> -
>>  SECTION = "libs"
>>  
>>  DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
>>  
>>  inherit autotools pkgconfig gnome gconf
>>  
>> -SRC_URI[archive.md5sum] = "2b702648b853402554c97d75405c60d3"
>> -SRC_URI[archive.sha256sum] = "eef0a9d6eca4e6af6c16b208947e3c958c428b94d22792bdd0b80c08a4b301db"
>> +SRC_URI[archive.md5sum] = "3c5a4fbd16a727c36974078e6d0e9575"
>> +SRC_URI[archive.sha256sum] = "8919e725aadd785380350c8dec7427d82cf33164bc9a9a549df9440a0c3da6d5"
>> +
>> +GNOME_COMPRESS_TYPE = "xz"
>>  
>>  EXTRA_OECONF = "\
>>  		--without-python \
>> -- 
>> 1.8.1
>
> Please fix this QA
>
> libgsf-1.14.26: libgsf: Files/directories were installed but not shipped
>   /usr/share/thumbnailers
>   /usr/share/thumbnailers/gsf-office.thumbnailer

Thanks for pointing that out, Martin.  I submited a new patch which
hopefully fixes that (this time with meta-gnome in the subject).

Best wishes.
Mario


