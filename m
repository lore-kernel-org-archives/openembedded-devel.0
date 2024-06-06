Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D72C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:30:24 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.19341.1717691418831434507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 09:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1yIVsIy;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f944cae15cso966712a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717691418; x=1718296218; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FQ9j+TDuRe6sXgir1h/r5DWOTEZzh4LbY487IS3yTo=;
        b=P1yIVsIyRmFTxDaMYCL7aBHVzxSyatLELUlAdhUNCFtHVoHP7b2evppFAkBefTuJ21
         A+y5JaKOCweLoUQOxkuhN9kbmKA3/BxPqv/wchN2wGjvmTmmfRZsu2r0y+q2T3ni6dA6
         UVqC/drLSRJm/irUO8F/NUPIT+bzNgwem8ldxwAvVHZpsndY9ZHFZJhfxDmyhzf4IFm5
         QzE9ao/mDUQjHjCAJgBm05/tvBThiaKDZ+QpMt9qdFBoOIDAkC2RhIgpQN8L2R2NkOCC
         mc+kHoWJn7xriz2/Ou0vwpLTJ2qRFziOoRlgvWO7NlbZxbKS4SusvcloTGf1wNmX3hka
         hNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717691418; x=1718296218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FQ9j+TDuRe6sXgir1h/r5DWOTEZzh4LbY487IS3yTo=;
        b=N7/5dR46Hd2yKPO08O+NjXSK9NS8Ge2sm34GMjMUqBMEZBraIu/1cibFTmxGgPsHjv
         cV6kwzXijQvM2p1jEt1eiDYBIuS8kBnjiFap2/HclMtzeCIKHwEtKP51UovcS5KdW1T5
         CEPUJIunEDNEibW4/ZIE0QxOyJ4AFeIQmlqfw23Yg8N7m4TjfoY8AiKnFaNBgOg4c/1u
         mPpi7+BMTw8MkYMNu+0rDatGP8zAoJ8fXTuB/kPLC0CTWYiXfSfkrM53N//9H2AosrvW
         o1MjwGSjT2w+thCA9osmOWyC1K8fVw6Ix2MqKeZWwC/6BL0Y9Dn3Ls2YxVWoqEDOGhlp
         s8ig==
X-Gm-Message-State: AOJu0YxhKg35qdSwqV2gKhguKQYiRUK39cu0XnNatJxMwjfeYw54ovdd
	7uiQURhvGpF/xjPUaq2nX3rBnehgA/vQagjMJdbKajIP4rqgOKkFDzX26rn6gGL/huC32sxvzK3
	5nM/yU8740p27dDk9nmGcW1Ya7BM=
X-Google-Smtp-Source: AGHT+IE8eCCKhPjmcI3NtPeodpqfmY4p9cfgfgMW5qIRduNsQZmHkFK6xTqkQ0V5fTwT1/H7CDxnX+ItKyfYV38vkFk=
X-Received: by 2002:a05:6808:1456:b0:3d1:ffe4:a66c with SMTP id
 5614622812f47-3d209c059c6mr1565313b6e.21.1717691415902; Thu, 06 Jun 2024
 09:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240606162307.972946-1-kai.kang@windriver.com> <20240606162307.972946-2-kai.kang@windriver.com>
In-Reply-To: <20240606162307.972946-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 09:29:48 -0700
Message-ID: <CAMKF1sq_k6mYr5bp5J0kt0UO14wbtKyUeBox3iZkuZ9Vj6ztFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] uw-imap: fix compile errors of
 incompatible pointer type
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110753

this patch is good cleanup patch please submit it upstream as well.

On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Fix compile errors when gcc option '-Wincompatible-pointer-types' set:
>
> mx.c: In function 'mx_setdate':
> mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible poin=
ter type [-Wincompatible-pointer-types]
>  1286 |   utime (file,tp);              /* set the times */
>       |               ^~
>       |               |
>       |               time_t * {aka long int *}
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...-imap-fix-incompatible-pointer-types.patch | 354 ++++++++++++++++++
>  .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
>  2 files changed, 355 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-=
incompatible-pointer-types.patch
>
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompa=
tible-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-ima=
p-fix-incompatible-pointer-types.patch
> new file mode 100644
> index 000000000..7146fbbeb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-p=
ointer-types.patch
> @@ -0,0 +1,354 @@
> +Fix compile errors when gcc option '-Wincompatible-pointer-types' set:
> +
> +mx.c: In function 'mx_setdate':
> +mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible poi=
nter type [-Wincompatible-pointer-types]
> + 1286 |   utime (file,tp);              /* set the times */
> +      |               ^~
> +      |               |
> +      |               time_t * {aka long int *}
> +
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +---
> + src/osdep/unix/mbx.c       |  12 ++++++------
> + src/osdep/unix/mh.c        |   2 +-
> + src/osdep/unix/mmdf.c      |  10 +++++-----
> + src/osdep/unix/mtx.c       |  16 ++++++++--------
> + src/osdep/unix/mx.c        |   2 +-
> + src/osdep/unix/tenex.c     |  16 ++++++++--------
> + src/osdep/unix/unix.c      |  10 +++++-----
> + 7 files changed, 34 insertions(+), 34 deletions(-)
> +
> +diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
> +index c8a45a5..0a587fe 100644
> +--- a/src/osdep/unix/mbx.c
> ++++ b/src/osdep/unix/mbx.c
> +@@ -302,7 +302,7 @@ int mbx_isvalid (MAILSTREAM **stream,char *name,char=
 *tmp,int *ld,char *lock,
> +     if (sbuf.st_ctime > sbuf.st_atime) {
> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> +       tp[1] =3D sbuf.st_mtime;
> +-      utime (tmp,tp);         /* set the times */
> ++      utime (tmp, (const struct utimbuf *)tp);                /* set th=
e times */
> +     }
> +   }
> +                               /* in case INBOX but not mbx format */
> +@@ -776,7 +776,7 @@ void mbx_flag (MAILSTREAM *stream,char *sequence,cha=
r *flag,long flags)
> +        stream->user_flags[LOCAL->ffuserflag]) || (oldpid !=3D LOCAL->la=
stpid))
> +       mbx_update_header (stream);
> +     tp[0] =3D time (0);         /* make sure read comes after all that =
*/
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> +   if (LOCAL->ld >=3D 0) {               /* unlock now */
> +     unlockfd (LOCAL->ld,LOCAL->lock);
> +@@ -1075,7 +1075,7 @@ long mbx_copy (MAILSTREAM *stream,char *sequence,c=
har *mailbox,long options)
> +                               /* else preserve \Marked status */
> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time=
(0);
> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   close (fd);                 /* close the file */
> +   MM_NOCRITICAL (stream);     /* release critical */
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +@@ -1213,7 +1213,7 @@ long mbx_append (MAILSTREAM *stream,char *mailbox,=
append_t af,void *data)
> +                               /* else preserve \Marked status */
> +     else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : ti=
me(0);
> +     tp[1] =3D sbuf.st_mtime;    /* preserve mtime */
> +-    utime (file,tp);          /* set the times */
> ++    utime (file, (const struct utimbuf *)tp);         /* set the times =
*/
> +     fclose (df);              /* close the file */
> +     MM_NOCRITICAL (dstream);  /* release critical */
> +   }
> +@@ -1446,7 +1446,7 @@ long mbx_parse (MAILSTREAM *stream)
> +     time_t tp[2];
> +     tp[0] =3D time (0);
> +     tp[1] =3D LOCAL->filetime;
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> +   stream->silent =3D silent;    /* can pass up events now */
> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox size=
 */
> +@@ -1814,7 +1814,7 @@ unsigned long mbx_rewrite (MAILSTREAM *stream,unsi=
gned long *reclaimed,
> +   fstat (LOCAL->fd,&sbuf);    /* get new write time */
> +   tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +   tp[0] =3D time (0);           /* reset atime to now */
> +-  utime (stream->mailbox,tp);
> ++  utime (stream->mailbox, (const struct utimbuf *)tp);
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +                               /* notify upper level of new mailbox size=
 */
> +   mail_exists (stream,stream->nmsgs);
> +diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
> +index 9264624..26f3539 100644
> +--- a/src/osdep/unix/mh.c
> ++++ b/src/osdep/unix/mh.c
> +@@ -1279,5 +1279,5 @@ void mh_setdate (char *file,MESSAGECACHE *elt)
> +   time_t tp[2];
> +   tp[0] =3D time (0);           /* atime is now */
> +   tp[1] =3D mail_longdate (elt);        /* modification time */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> + }
> +diff --git a/src/osdep/unix/mmdf.c b/src/osdep/unix/mmdf.c
> +index e962434..c0adbee 100644
> +--- a/src/osdep/unix/mmdf.c
> ++++ b/src/osdep/unix/mmdf.c
> +@@ -379,7 +379,7 @@ long mmdf_isvalid (char *name,char *tmp)
> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_a=
time)) {
> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> +       tp[1] =3D sbuf.st_mtime;
> +-      utime (file,tp);        /* set the times */
> ++      utime (file, (const struct utimbuf *)tp);       /* set the times =
*/
> +       }
> +     }
> +   }
> +@@ -1131,7 +1131,7 @@ long mmdf_copy (MAILSTREAM *stream,char *sequence,=
char *mailbox,long options)
> +   else tp[0] =3D                        /* else preserve \Marked status=
 */
> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_ati=
me)) ?
> +        sbuf.st_atime : tp[1];
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   mmdf_unlock (fd,NIL,&lock); /* unlock and close mailbox */
> +   if (tstream) {              /* update last UID if we can */
> +     MMDFLOCAL *local =3D (MMDFLOCAL *) tstream->local;
> +@@ -1292,7 +1292,7 @@ long mmdf_append (MAILSTREAM *stream,char *mailbox=
,append_t af,void *data)
> +     ret =3D NIL;                        /* return error */
> +   }
> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful cop=
y */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   fclose (sf);                        /* done with scratch file */
> +                               /* force UIDVALIDITY assignment now */
> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D time=
 (0);
> +@@ -1550,7 +1550,7 @@ void mmdf_unlock (int fd,MAILSTREAM *stream,DOTLOC=
K *lock)
> +     }
> +     else now =3D 0;             /* no time change needed */
> +                               /* set the times, note change */
> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp)) LO=
CAL->filetime =3D tp[1];
> +   }
> +   flock (fd,LOCK_UN);         /* release flock'ers */
> +   if (!stream) close (fd);    /* close the file if no stream */
> +@@ -2393,7 +2393,7 @@ long mmdf_rewrite (MAILSTREAM *stream,unsigned lon=
g *nexp,DOTLOCK *lock,
> +                               /* set atime to now, mtime a second earli=
er */
> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
> +                               /* set the times, note change */
> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->fi=
letime =3D tp[1];
> +     close (LOCAL->fd);                /* close and reopen file */
> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
> +                          (long) mail_parameters (NIL,GET_MBXPROTECTION,=
NIL)))
> +diff --git a/src/osdep/unix/mtx.c b/src/osdep/unix/mtx.c
> +index 8e6f76e..f64142b 100644
> +--- a/src/osdep/unix/mtx.c
> ++++ b/src/osdep/unix/mtx.c
> +@@ -196,7 +196,7 @@ int mtx_isvalid (char *name,char *tmp)
> +       if (sbuf.st_ctime > sbuf.st_atime) {
> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> +       tp[1] =3D sbuf.st_mtime;
> +-      utime (file,tp);        /* set the times */
> ++      utime (file, (const struct utimbuf *)tp);       /* set the times =
*/
> +       }
> +     }
> +   }
> +@@ -565,7 +565,7 @@ void mtx_flag (MAILSTREAM *stream,char *sequence,cha=
r *flag,long flags)
> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +     tp[0] =3D time (0);         /* make sure read comes after all that =
*/
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> + }
> +
> +@@ -834,7 +834,7 @@ long mtx_expunge (MAILSTREAM *stream,char *sequence,=
long options)
> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* reset atime to now */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +       MM_NOCRITICAL (stream); /* release critical */
> +                               /* notify upper level of new mailbox size=
 */
> +       mail_exists (stream,stream->nmsgs);
> +@@ -929,7 +929,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,cha=
r *mailbox,long options)
> +                               /* else preserve \Marked status */
> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time=
(0);
> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   close (fd);                 /* close the file */
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +   MM_NOCRITICAL (stream);     /* release critical */
> +@@ -946,7 +946,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,cha=
r *mailbox,long options)
> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* make sure atime remains grea=
ter */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +     }
> +   }
> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
> +@@ -1062,7 +1062,7 @@ long mtx_append (MAILSTREAM *stream,char *mailbox,=
append_t af,void *data)
> +                               /* else preserve \Marked status */
> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time=
(0);
> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   fclose (df);                        /* close the file */
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +   MM_NOCRITICAL (stream);     /* release critical */
> +@@ -1212,7 +1212,7 @@ long mtx_parse (MAILSTREAM *stream)
> +     time_t tp[2];
> +     tp[0] =3D time (0);
> +     tp[1] =3D LOCAL->filetime;
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> +   stream->silent =3D silent;    /* can pass up events now */
> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox size=
 */
> +@@ -1312,7 +1312,7 @@ void mtx_update_status (MAILSTREAM *stream,unsigne=
d long msgno,long syncflag)
> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* make sure read is later */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +     }
> +   }
> + }
> +diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
> +index b5c5adf..4146409 100644
> +--- a/src/osdep/unix/mx.c
> ++++ b/src/osdep/unix/mx.c
> +@@ -1283,5 +1283,5 @@ void mx_setdate (char *file,MESSAGECACHE *elt)
> +   time_t tp[2];
> +   tp[0] =3D time (0);           /* atime is now */
> +   tp[1] =3D mail_longdate (elt);        /* modification time */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> + }
> +diff --git a/src/osdep/unix/tenex.c b/src/osdep/unix/tenex.c
> +index eee61fb..622da61 100644
> +--- a/src/osdep/unix/tenex.c
> ++++ b/src/osdep/unix/tenex.c
> +@@ -203,7 +203,7 @@ int tenex_isvalid (char *name,char *tmp)
> +       if (sbuf.st_ctime > sbuf.st_atime) {
> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> +       tp[1] =3D sbuf.st_mtime;
> +-      utime (file,tp);        /* set the times */
> ++      utime (file, (const struct utimbuf *)tp);       /* set the times =
*/
> +       }
> +     }
> +   }
> +@@ -654,7 +654,7 @@ void tenex_flag (MAILSTREAM *stream,char *sequence,c=
har *flag,long flags)
> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +     tp[0] =3D time (0);         /* make sure read comes after all that =
*/
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> + }
> +
> +@@ -924,7 +924,7 @@ long tenex_expunge (MAILSTREAM *stream,char *sequenc=
e,long options)
> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* reset atime to now */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +       MM_NOCRITICAL (stream); /* release critical */
> +                               /* notify upper level of new mailbox size=
 */
> +       mail_exists (stream,stream->nmsgs);
> +@@ -1019,7 +1019,7 @@ long tenex_copy (MAILSTREAM *stream,char *sequence=
,char *mailbox,long options)
> +                               /* else preserve \Marked status */
> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time=
(0);
> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   close (fd);                 /* close the file */
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +   MM_NOCRITICAL (stream);     /* release critical */
> +@@ -1036,7 +1036,7 @@ long tenex_copy (MAILSTREAM *stream,char *sequence=
,char *mailbox,long options)
> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* make sure atime remains grea=
ter */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +     }
> +   }
> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
> +@@ -1159,7 +1159,7 @@ long tenex_append (MAILSTREAM *stream,char *mailbo=
x,append_t af,void *data)
> +                               /* else preserve \Marked status */
> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time=
(0);
> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   fclose (df);                        /* close the file */
> +   unlockfd (ld,lock);         /* release exclusive parse/append permiss=
ion */
> +   MM_NOCRITICAL (stream);     /* release critical */
> +@@ -1324,7 +1324,7 @@ long tenex_parse (MAILSTREAM *stream)
> +     time_t tp[2];
> +     tp[0] =3D time (0);
> +     tp[1] =3D LOCAL->filetime;
> +-    utime (stream->mailbox,tp);
> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> +   }
> +   stream->silent =3D silent;    /* can pass up events now */
> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox size=
 */
> +@@ -1424,7 +1424,7 @@ void tenex_update_status (MAILSTREAM *stream,unsig=
ned long msgno,long syncflag)
> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> +       tp[0] =3D time (0);               /* make sure read is later */
> +-      utime (stream->mailbox,tp);
> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> +     }
> +   }
> + }
> +diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
> +index 86be3f9..012dc83 100644
> +--- a/src/osdep/unix/unix.c
> ++++ b/src/osdep/unix/unix.c
> +@@ -232,7 +232,7 @@ DRIVER *unix_valid (char *name)
> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_a=
time)) {
> +       tp[0] =3D sbuf.st_atime;  /* yes, preserve atime and mtime */
> +       tp[1] =3D sbuf.st_mtime;
> +-      utime (file,tp);        /* set the times */
> ++      utime (file, (const struct utimbuf *)tp);       /* set the times =
*/
> +       }
> +     }
> +   }
> +@@ -999,7 +999,7 @@ long unix_copy (MAILSTREAM *stream,char *sequence,ch=
ar *mailbox,long options)
> +   else tp[0] =3D                        /* else preserve \Marked status=
 */
> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_ati=
me)) ?
> +        sbuf.st_atime : tp[1];
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   unix_unlock (fd,NIL,&lock); /* unlock and close mailbox */
> +   if (tstream) {              /* update last UID if we can */
> +     UNIXLOCAL *local =3D (UNIXLOCAL *) tstream->local;
> +@@ -1160,7 +1160,7 @@ long unix_append (MAILSTREAM *stream,char *mailbox=
,append_t af,void *data)
> +     ret =3D NIL;                        /* return error */
> +   }
> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful cop=
y */
> +-  utime (file,tp);            /* set the times */
> ++  utime (file, (const struct utimbuf *)tp);           /* set the times =
*/
> +   fclose (sf);                        /* done with scratch file */
> +                               /* force UIDVALIDITY assignment now */
> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D time=
 (0);
> +@@ -1425,7 +1425,7 @@ void unix_unlock (int fd,MAILSTREAM *stream,DOTLOC=
K *lock)
> +     }
> +     else now =3D 0;             /* no time change needed */
> +                               /* set the times, note change */
> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp)) LO=
CAL->filetime =3D tp[1];
> +   }
> +   flock (fd,LOCK_UN);         /* release flock'ers */
> +   if (!stream) close (fd);    /* close the file if no stream */
> +@@ -2251,7 +2251,7 @@ long unix_rewrite (MAILSTREAM *stream,unsigned lon=
g *nexp,DOTLOCK *lock,
> +                               /* set atime to now, mtime a second earli=
er */
> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
> +                               /* set the times, note change */
> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->fi=
letime =3D tp[1];
> +     close (LOCAL->fd);                /* close and reopen file */
> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
> +                          (long) mail_parameters (NIL,GET_MBXPROTECTION,=
NIL)))
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/=
recipes-devtools/uw-imap/uw-imap_2007f.bb
> index 17faa3aa6..7e3bddb58 100644
> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/imap-${=
PV}.tar.gz \
>             file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>             file://0001-Fix-Wincompatible-function-pointer-types.patch \
>             file://uw-imap-newer-tls.patch \
> +           file://uw-imap-fix-incompatible-pointer-types.patch \
>             "
>
>  SRC_URI[md5sum] =3D "2126fd125ea26b73b20f01fcd5940369"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110750): https://lists.openembedded.org/g/openembedde=
d-devel/message/110750
> Mute This Topic: https://lists.openembedded.org/mt/106526690/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

