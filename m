Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BE331609B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 19:53:41 +0000 (UTC)
Received: from [192.168.178.14] (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id DDF8E29672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 21:53:40 +0200 (CEST)
Message-ID: <53600344.4030801@pseudoterminal.org>
Date: Tue, 29 Apr 2014 21:53:40 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>	<1398753593-4447-4-git-send-email-dv@pseudoterminal.org>
	<CAP9ODKq3Es6T2weEZXZnUtYHs3J6FKVG1e6VA-6k8j_425wuvA@mail.gmail.com>
In-Reply-To: <CAP9ODKq3Es6T2weEZXZnUtYHs3J6FKVG1e6VA-6k8j_425wuvA@mail.gmail.com>
Subject: Re: [meta-browser][PATCH v2 3/4] chromium: Add use-egl PACKAGECONFIG option
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
X-List-Received-Date: Tue, 29 Apr 2014 19:53:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-04-29 20:30, Otavio Salvador wrote:
> On Tue, Apr 29, 2014 at 3:39 AM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> By default, Chromium will try to use GLX and regular OpenGL. On embedded
>> platforms, these are often not present, or unaccelerated, and using EGL
>> and OpenGL ES instead makes more sense. To produce builds that use EGL and
>> OpenGL ES by default instead, this PACKAGECONFIG option can be used.
>>
>> An EGL/OpenGLES-enabled build produces a chromium version that renders
>> 2D and WebGL with GPU acceleration (if present).
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   recipes-browser/chromium/chromium_35.0.1883.0.bb | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>> index 1923b4e..1fb050f 100644
>> --- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
>> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>> @@ -23,6 +23,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
>>
>>   inherit gettext
>>
>> +# this makes sure the dependencies for the EGL mode are present; otherwise, the configure scripts
>> +# automatically and silently fall back to GLX
>> +PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
> There is any way to 'force' build to use egl here and fail if
> something here is missing?
>

That is actually tough. Chromium does not simply link to the EGL and 
GLESv2 libraries; it opens them with dlopen() and gets the GL function 
pointers with dlsym() , as part of the sandboxing strategy. Furthermore, 
cairo requires virtual/egl too (not virtual/libgles2 though). As for 
compilation errors, I haven't found a way to provoke them. I am not 
entirely sure if Chromium is using system EGL/GLES headers, or if it is 
always using its internal copy of the Khronos headers instead. I got 
conflicting responses. So, to be sure (and also to emphasize the 
dependency in the recipe), I added it.

What is certain is that without the --use-gl=egl switch, Chromium will 
always use GLX.

