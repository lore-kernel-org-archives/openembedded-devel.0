Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KIUC5-0002Xh-2T
	for openembedded-devel@openembedded.org; Mon, 14 Jul 2008 21:58:45 +0200
Received: by an-out-0708.google.com with SMTP id b21so971328ana.6
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jul 2008 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=I67X5hmz5OSZ+0QtL4zJjhZh+nvVUFSbA0LIIJQ9W7Q=;
	b=nZR958vcpnyhjBWJIcYf9TlZ8mX3ONtMnyPGoD5uToNtciEQnip0xnLJbZG+PXzke5
	mJb9qwLffUkDuvs0ScoLrSYfuceETqORlYd/cdGCE/lXu5VAhUZajhOImuV3Df2LOLu2
	dvq3wPDsBQt/dURDtcgcXsxTWPeVu/uiId+6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=IIge8gF2Pr9p+7rpsvh0v4ZnCO8W2F/rP/ay34kzbGeKsXsw394rRD4nlRGSbUHN66
	5rZT+k7IfGDTwIuy5JJsobPAlyH9wLc7TU1Zd2FUDYCvdG78/q5rfqO6lzGcVT1UqL4V
	rsNGLgdbc+uM+QDjWQzUj1/3BJJSOTWIdsJ2w=
Received: by 10.100.168.18 with SMTP id q18mr10681444ane.15.1216065492310;
	Mon, 14 Jul 2008 12:58:12 -0700 (PDT)
Received: by 10.100.137.1 with HTTP; Mon, 14 Jul 2008 12:58:12 -0700 (PDT)
Message-ID: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
Date: Mon, 14 Jul 2008 14:58:12 -0500
From: "E Robertson" <e.robertson.svg@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: Strange header file error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 14 Jul 2008 19:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,
I'm trying to explain this pthread.h header file error.
I include this header file in my program. The snip of interest is this:

#ifndef _PTHREAD_H
#define _PTHREAD_H  1

#include <features.h>

#include <sched.h>
#include <time.h>

#define __need_sigset_t
#include <signal.h>
#include <bits/pthreadtypes.h>
#include <bits/initspin.h>

__BEGIN_DECLS

/* Initializers.  */

#define PTHREAD_MUTEX_INITIALIZER \
  {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
#ifdef __USE_GNU
# define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
  {0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __LOCK_INITIALIZER}
# define PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP \
  {0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __LOCK_INITIALIZER}
# define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP \
  {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
#endif


This is included in another header file where I place some #ifdef
statements for  _PTHREAD_H,
PTHREAD_MUTEX_INITIALIZER, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP, and
__USE_GNU.
I also defined __USE_GNU just before the header file and none of these
are redefined anywhere else.

From this I notice all these defines are valid and present _except_
PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP.
I haven't figured out why this is so wired I don't see any possible
reason how this could be possible.
Am I out of my mind here? Is this really possible? Unless my
arm-uclibc is doing something strange, I don't see how this could be.
Anyone seen this before?  Thanks much.


