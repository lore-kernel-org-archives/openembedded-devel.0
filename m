Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C01FB71AB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 12:51:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3HCppox029663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Apr 2018 05:51:51 -0700 (PDT)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 17 Apr 2018 05:51:51 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1523955884-38040-1-git-send-email-hongxu.jia@windriver.com>
	<1523956656-12896-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQdtV1S4oq-NVt86NG2J20t51XhUpt-2C1OZJLOH86unrw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <f0efc6ff-3236-ec25-27bf-64495955d7e1@windriver.com>
Date: Tue, 17 Apr 2018 20:51:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdtV1S4oq-NVt86NG2J20t51XhUpt-2C1OZJLOH86unrw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2] qtbase: add disable option to opengl PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2018 12:51:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年04月17日 18:39, Martin Jansa wrote:
> How does this work with gles2 PACKAGECONFIG?
>
> It was intentionally like this to implement tri-state options 
> (desktop, es2, no).
>

Yes, you are right

//Hongxu

> On Tue, Apr 17, 2018 at 11:17 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     The qtbase detect oepngl by default and report error if not found,
>     add disable option while explicitly disable it.
>
>     Remove useless no-opengl PACKAGECONFIG
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb> | 3 +--
>      1 file changed, 1 insertion(+), 2 deletions(-)
>
>     diff --git a/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>     b/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>     index 5c4fe4f..ca056af 100644
>     --- a/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>     +++ b/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>     @@ -111,9 +111,8 @@ PACKAGECONFIG[ico] = "-ico,-no-ico"
>      PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
>      PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
>      PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
>     -PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
>     +PACKAGECONFIG[gl] = "-opengl desktop,-no-opengl,virtual/libgl"
>      PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
>     -PACKAGECONFIG[no-opengl] = "-no-opengl"
>      PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
>      PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>      PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


