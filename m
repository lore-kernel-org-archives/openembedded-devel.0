Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81107C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:06:10 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.42923.1717769166073561159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 07:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jfFli8/v;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f95084c257so958902a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717769165; x=1718373965; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9koTe0VGkVL1i36Mki7gNNFoMPvWTOklaCHLuMTsjHQ=;
        b=jfFli8/vuLRjCk0K7U2ciYIJNRqP/HunL3f7RsTevNXdwyIXMFj6lPLrCy6yD8SHkr
         8bNRJyxo+AvTU/FnR8tL44zGX91xceVFOGpif3uUsSAHYziD8LjWbAYDd5DMHGQpgZbS
         d8o9DXFfK0+d9FgYHuqdkeE5uONvV8VnbEwSFZo1l+naIuxbl27kvdgQWv5OkibLntfu
         SKv+Tt6D2HxySSp3wEK5nax1cR3r+Vi5eu5O+sK2wJJ+97FTw39nSuqSTEdqqRU3JPPz
         aMjT+wyTzPZpcjDR4mgSgNccD9ZOCHd1g9OXwPAG8SkmLWK7AzSsyIya68IqkyvfOX3v
         aqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717769165; x=1718373965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9koTe0VGkVL1i36Mki7gNNFoMPvWTOklaCHLuMTsjHQ=;
        b=KAAItKBR4hoXtbgukryrcASBtEBkOJanXzeFGLdHSs4ZZPnizwWGVHYj6j32488pya
         rVG/7vSWAPs+ggojJlX1/pBttZfVbN024oWR7IILyZctI3Kunt+ED4VHbBQhWTbtk8i1
         RPZjsxYxsh6XgnbHnXdyu1b2mNiLGjfwTDY+uKkhjGs+XWzmsdjG7O4Cc4PwWZHXKLhn
         LLoKCtlKp2nDbs+s1ulDynnDyu1JKEp6NrS2Btm+Y1UmUNvD/4MgW+j4YZSdvRfscrqf
         x0pH1Vbs6P2XKGnMPyWKm+6EUk0OIFxAuk240ikm9KeOj2UEGaSFGsBqS2B3HZ1M03Lf
         Z7SQ==
X-Gm-Message-State: AOJu0Yw4/8jXL8HeQ+cmgTWLUpyNEM8tgu5CnFCenBwa4vfPJ9T1A4MY
	PVbEnNSMkOF0rHb+MglDSxegxXfl+cXd4hczsqQA93m5CUOShbNBgyabJKyQ0R0C2YeG6nIBHDf
	5Bp+W2pdoE1Z6LwTMoQCqHUrUttTlYg==
X-Google-Smtp-Source: AGHT+IH11dN+SGEKScXTCnmmagjebn6PkhYA7I81/zIF5Ti8SBfry1PD/Pq/wykfdsZUb36Ym7icWsFCSZZ9Mik3t0c=
X-Received: by 2002:a05:6870:6387:b0:250:6793:74ed with SMTP id
 586e51a60fabf-254646841eamr3006129fac.36.1717769164691; Fri, 07 Jun 2024
 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240606162307.972946-1-kai.kang@windriver.com>
 <20240606162307.972946-2-kai.kang@windriver.com> <CAMKF1sq_k6mYr5bp5J0kt0UO14wbtKyUeBox3iZkuZ9Vj6ztFg@mail.gmail.com>
 <b3b42523-5dfa-44ba-a50f-e3bc0904fa95@windriver.com>
In-Reply-To: <b3b42523-5dfa-44ba-a50f-e3bc0904fa95@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jun 2024 07:05:37 -0700
Message-ID: <CAMKF1sraL2hMj06iABhmyN65MunnHikWh1mDh0KPmAtiE-eP2Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] uw-imap: fix compile errors of
 incompatible pointer type
To: Kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 14:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110767

On Fri, Jun 7, 2024 at 12:56=E2=80=AFAM Kai <kai.kang@windriver.com> wrote:
>
> On 6/7/24 00:29, Khem Raj wrote:
> > this patch is good cleanup patch please submit it upstream as well.
>
> It seems uw-imap project has been stalled and no upstream to submit.
> Other uw-imap
> patches have 'Pending' status too.
>

Thanks, in that case update the upstream status ro reflect
Inappropriate [Upstream dead] or something
pending means it should be send upstream at some point.

> Regards,
> Kai
>
> >
> > On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> > <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Fix compile errors when gcc option '-Wincompatible-pointer-types' set:
> >>
> >> mx.c: In function 'mx_setdate':
> >> mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible p=
ointer type [-Wincompatible-pointer-types]
> >>   1286 |   utime (file,tp);              /* set the times */
> >>        |               ^~
> >>        |               |
> >>        |               time_t * {aka long int *}
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   ...-imap-fix-incompatible-pointer-types.patch | 354 ++++++++++++++++=
++
> >>   .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
> >>   2 files changed, 355 insertions(+)
> >>   create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-=
fix-incompatible-pointer-types.patch
> >>
> >> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-inco=
mpatible-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-=
imap-fix-incompatible-pointer-types.patch
> >> new file mode 100644
> >> index 000000000..7146fbbeb
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatibl=
e-pointer-types.patch
> >> @@ -0,0 +1,354 @@
> >> +Fix compile errors when gcc option '-Wincompatible-pointer-types' set=
:
> >> +
> >> +mx.c: In function 'mx_setdate':
> >> +mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible =
pointer type [-Wincompatible-pointer-types]
> >> + 1286 |   utime (file,tp);              /* set the times */
> >> +      |               ^~
> >> +      |               |
> >> +      |               time_t * {aka long int *}
> >> +
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +
> >> +---
> >> + src/osdep/unix/mbx.c       |  12 ++++++------
> >> + src/osdep/unix/mh.c        |   2 +-
> >> + src/osdep/unix/mmdf.c      |  10 +++++-----
> >> + src/osdep/unix/mtx.c       |  16 ++++++++--------
> >> + src/osdep/unix/mx.c        |   2 +-
> >> + src/osdep/unix/tenex.c     |  16 ++++++++--------
> >> + src/osdep/unix/unix.c      |  10 +++++-----
> >> + 7 files changed, 34 insertions(+), 34 deletions(-)
> >> +
> >> +diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
> >> +index c8a45a5..0a587fe 100644
> >> +--- a/src/osdep/unix/mbx.c
> >> ++++ b/src/osdep/unix/mbx.c
> >> +@@ -302,7 +302,7 @@ int mbx_isvalid (MAILSTREAM **stream,char *name,c=
har *tmp,int *ld,char *lock,
> >> +     if (sbuf.st_ctime > sbuf.st_atime) {
> >> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> >> +       tp[1] =3D sbuf.st_mtime;
> >> +-      utime (tmp,tp);         /* set the times */
> >> ++      utime (tmp, (const struct utimbuf *)tp);                /* set=
 the times */
> >> +     }
> >> +   }
> >> +                               /* in case INBOX but not mbx format */
> >> +@@ -776,7 +776,7 @@ void mbx_flag (MAILSTREAM *stream,char *sequence,=
char *flag,long flags)
> >> +        stream->user_flags[LOCAL->ffuserflag]) || (oldpid !=3D LOCAL-=
>lastpid))
> >> +       mbx_update_header (stream);
> >> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> +   if (LOCAL->ld >=3D 0) {               /* unlock now */
> >> +     unlockfd (LOCAL->ld,LOCAL->lock);
> >> +@@ -1075,7 +1075,7 @@ long mbx_copy (MAILSTREAM *stream,char *sequenc=
e,char *mailbox,long options)
> >> +                               /* else preserve \Marked status */
> >> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
> >> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   close (fd);                 /* close the file */
> >> +   MM_NOCRITICAL (stream);     /* release critical */
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +@@ -1213,7 +1213,7 @@ long mbx_append (MAILSTREAM *stream,char *mailb=
ox,append_t af,void *data)
> >> +                               /* else preserve \Marked status */
> >> +     else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
> >> +     tp[1] =3D sbuf.st_mtime;    /* preserve mtime */
> >> +-    utime (file,tp);          /* set the times */
> >> ++    utime (file, (const struct utimbuf *)tp);         /* set the tim=
es */
> >> +     fclose (df);              /* close the file */
> >> +     MM_NOCRITICAL (dstream);  /* release critical */
> >> +   }
> >> +@@ -1446,7 +1446,7 @@ long mbx_parse (MAILSTREAM *stream)
> >> +     time_t tp[2];
> >> +     tp[0] =3D time (0);
> >> +     tp[1] =3D LOCAL->filetime;
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> +   stream->silent =3D silent;    /* can pass up events now */
> >> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
> >> +@@ -1814,7 +1814,7 @@ unsigned long mbx_rewrite (MAILSTREAM *stream,u=
nsigned long *reclaimed,
> >> +   fstat (LOCAL->fd,&sbuf);    /* get new write time */
> >> +   tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +   tp[0] =3D time (0);           /* reset atime to now */
> >> +-  utime (stream->mailbox,tp);
> >> ++  utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +                               /* notify upper level of new mailbox s=
ize */
> >> +   mail_exists (stream,stream->nmsgs);
> >> +diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
> >> +index 9264624..26f3539 100644
> >> +--- a/src/osdep/unix/mh.c
> >> ++++ b/src/osdep/unix/mh.c
> >> +@@ -1279,5 +1279,5 @@ void mh_setdate (char *file,MESSAGECACHE *elt)
> >> +   time_t tp[2];
> >> +   tp[0] =3D time (0);           /* atime is now */
> >> +   tp[1] =3D mail_longdate (elt);        /* modification time */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> + }
> >> +diff --git a/src/osdep/unix/mmdf.c b/src/osdep/unix/mmdf.c
> >> +index e962434..c0adbee 100644
> >> +--- a/src/osdep/unix/mmdf.c
> >> ++++ b/src/osdep/unix/mmdf.c
> >> +@@ -379,7 +379,7 @@ long mmdf_isvalid (char *name,char *tmp)
> >> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) {
> >> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> >> +       tp[1] =3D sbuf.st_mtime;
> >> +-      utime (file,tp);        /* set the times */
> >> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
> >> +       }
> >> +     }
> >> +   }
> >> +@@ -1131,7 +1131,7 @@ long mmdf_copy (MAILSTREAM *stream,char *sequen=
ce,char *mailbox,long options)
> >> +   else tp[0] =3D                        /* else preserve \Marked sta=
tus */
> >> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_=
atime)) ?
> >> +        sbuf.st_atime : tp[1];
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   mmdf_unlock (fd,NIL,&lock); /* unlock and close mailbox */
> >> +   if (tstream) {              /* update last UID if we can */
> >> +     MMDFLOCAL *local =3D (MMDFLOCAL *) tstream->local;
> >> +@@ -1292,7 +1292,7 @@ long mmdf_append (MAILSTREAM *stream,char *mail=
box,append_t af,void *data)
> >> +     ret =3D NIL;                        /* return error */
> >> +   }
> >> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful =
copy */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   fclose (sf);                        /* done with scratch file */
> >> +                               /* force UIDVALIDITY assignment now */
> >> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D t=
ime (0);
> >> +@@ -1550,7 +1550,7 @@ void mmdf_unlock (int fd,MAILSTREAM *stream,DOT=
LOCK *lock)
> >> +     }
> >> +     else now =3D 0;             /* no time change needed */
> >> +                               /* set the times, note change */
> >> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1=
];
> >> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp))=
 LOCAL->filetime =3D tp[1];
> >> +   }
> >> +   flock (fd,LOCK_UN);         /* release flock'ers */
> >> +   if (!stream) close (fd);    /* close the file if no stream */
> >> +@@ -2393,7 +2393,7 @@ long mmdf_rewrite (MAILSTREAM *stream,unsigned =
long *nexp,DOTLOCK *lock,
> >> +                               /* set atime to now, mtime a second ea=
rlier */
> >> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
> >> +                               /* set the times, note change */
> >> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> >> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL-=
>filetime =3D tp[1];
> >> +     close (LOCAL->fd);                /* close and reopen file */
> >> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
> >> +                          (long) mail_parameters (NIL,GET_MBXPROTECTI=
ON,NIL)))
> >> +diff --git a/src/osdep/unix/mtx.c b/src/osdep/unix/mtx.c
> >> +index 8e6f76e..f64142b 100644
> >> +--- a/src/osdep/unix/mtx.c
> >> ++++ b/src/osdep/unix/mtx.c
> >> +@@ -196,7 +196,7 @@ int mtx_isvalid (char *name,char *tmp)
> >> +       if (sbuf.st_ctime > sbuf.st_atime) {
> >> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> >> +       tp[1] =3D sbuf.st_mtime;
> >> +-      utime (file,tp);        /* set the times */
> >> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
> >> +       }
> >> +     }
> >> +   }
> >> +@@ -565,7 +565,7 @@ void mtx_flag (MAILSTREAM *stream,char *sequence,=
char *flag,long flags)
> >> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
> >> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> + }
> >> +
> >> +@@ -834,7 +834,7 @@ long mtx_expunge (MAILSTREAM *stream,char *sequen=
ce,long options)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* reset atime to now */
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +       MM_NOCRITICAL (stream); /* release critical */
> >> +                               /* notify upper level of new mailbox s=
ize */
> >> +       mail_exists (stream,stream->nmsgs);
> >> +@@ -929,7 +929,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,=
char *mailbox,long options)
> >> +                               /* else preserve \Marked status */
> >> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
> >> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   close (fd);                 /* close the file */
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +   MM_NOCRITICAL (stream);     /* release critical */
> >> +@@ -946,7 +946,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,=
char *mailbox,long options)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* make sure atime remains g=
reater */
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +     }
> >> +   }
> >> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
> >> +@@ -1062,7 +1062,7 @@ long mtx_append (MAILSTREAM *stream,char *mailb=
ox,append_t af,void *data)
> >> +                               /* else preserve \Marked status */
> >> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
> >> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   fclose (df);                        /* close the file */
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +   MM_NOCRITICAL (stream);     /* release critical */
> >> +@@ -1212,7 +1212,7 @@ long mtx_parse (MAILSTREAM *stream)
> >> +     time_t tp[2];
> >> +     tp[0] =3D time (0);
> >> +     tp[1] =3D LOCAL->filetime;
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> +   stream->silent =3D silent;    /* can pass up events now */
> >> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
> >> +@@ -1312,7 +1312,7 @@ void mtx_update_status (MAILSTREAM *stream,unsi=
gned long msgno,long syncflag)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* make sure read is later *=
/
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +     }
> >> +   }
> >> + }
> >> +diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
> >> +index b5c5adf..4146409 100644
> >> +--- a/src/osdep/unix/mx.c
> >> ++++ b/src/osdep/unix/mx.c
> >> +@@ -1283,5 +1283,5 @@ void mx_setdate (char *file,MESSAGECACHE *elt)
> >> +   time_t tp[2];
> >> +   tp[0] =3D time (0);           /* atime is now */
> >> +   tp[1] =3D mail_longdate (elt);        /* modification time */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> + }
> >> +diff --git a/src/osdep/unix/tenex.c b/src/osdep/unix/tenex.c
> >> +index eee61fb..622da61 100644
> >> +--- a/src/osdep/unix/tenex.c
> >> ++++ b/src/osdep/unix/tenex.c
> >> +@@ -203,7 +203,7 @@ int tenex_isvalid (char *name,char *tmp)
> >> +       if (sbuf.st_ctime > sbuf.st_atime) {
> >> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
> >> +       tp[1] =3D sbuf.st_mtime;
> >> +-      utime (file,tp);        /* set the times */
> >> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
> >> +       }
> >> +     }
> >> +   }
> >> +@@ -654,7 +654,7 @@ void tenex_flag (MAILSTREAM *stream,char *sequenc=
e,char *flag,long flags)
> >> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
> >> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> + }
> >> +
> >> +@@ -924,7 +924,7 @@ long tenex_expunge (MAILSTREAM *stream,char *sequ=
ence,long options)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* reset atime to now */
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +       MM_NOCRITICAL (stream); /* release critical */
> >> +                               /* notify upper level of new mailbox s=
ize */
> >> +       mail_exists (stream,stream->nmsgs);
> >> +@@ -1019,7 +1019,7 @@ long tenex_copy (MAILSTREAM *stream,char *seque=
nce,char *mailbox,long options)
> >> +                               /* else preserve \Marked status */
> >> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
> >> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   close (fd);                 /* close the file */
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +   MM_NOCRITICAL (stream);     /* release critical */
> >> +@@ -1036,7 +1036,7 @@ long tenex_copy (MAILSTREAM *stream,char *seque=
nce,char *mailbox,long options)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* make sure atime remains g=
reater */
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +     }
> >> +   }
> >> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
> >> +@@ -1159,7 +1159,7 @@ long tenex_append (MAILSTREAM *stream,char *mai=
lbox,append_t af,void *data)
> >> +                               /* else preserve \Marked status */
> >> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
> >> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   fclose (df);                        /* close the file */
> >> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
> >> +   MM_NOCRITICAL (stream);     /* release critical */
> >> +@@ -1324,7 +1324,7 @@ long tenex_parse (MAILSTREAM *stream)
> >> +     time_t tp[2];
> >> +     tp[0] =3D time (0);
> >> +     tp[1] =3D LOCAL->filetime;
> >> +-    utime (stream->mailbox,tp);
> >> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +   }
> >> +   stream->silent =3D silent;    /* can pass up events now */
> >> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
> >> +@@ -1424,7 +1424,7 @@ void tenex_update_status (MAILSTREAM *stream,un=
signed long msgno,long syncflag)
> >> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
> >> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
> >> +       tp[0] =3D time (0);               /* make sure read is later *=
/
> >> +-      utime (stream->mailbox,tp);
> >> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
> >> +     }
> >> +   }
> >> + }
> >> +diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
> >> +index 86be3f9..012dc83 100644
> >> +--- a/src/osdep/unix/unix.c
> >> ++++ b/src/osdep/unix/unix.c
> >> +@@ -232,7 +232,7 @@ DRIVER *unix_valid (char *name)
> >> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) {
> >> +       tp[0] =3D sbuf.st_atime;  /* yes, preserve atime and mtime */
> >> +       tp[1] =3D sbuf.st_mtime;
> >> +-      utime (file,tp);        /* set the times */
> >> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
> >> +       }
> >> +     }
> >> +   }
> >> +@@ -999,7 +999,7 @@ long unix_copy (MAILSTREAM *stream,char *sequence=
,char *mailbox,long options)
> >> +   else tp[0] =3D                        /* else preserve \Marked sta=
tus */
> >> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_=
atime)) ?
> >> +        sbuf.st_atime : tp[1];
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   unix_unlock (fd,NIL,&lock); /* unlock and close mailbox */
> >> +   if (tstream) {              /* update last UID if we can */
> >> +     UNIXLOCAL *local =3D (UNIXLOCAL *) tstream->local;
> >> +@@ -1160,7 +1160,7 @@ long unix_append (MAILSTREAM *stream,char *mail=
box,append_t af,void *data)
> >> +     ret =3D NIL;                        /* return error */
> >> +   }
> >> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful =
copy */
> >> +-  utime (file,tp);            /* set the times */
> >> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
> >> +   fclose (sf);                        /* done with scratch file */
> >> +                               /* force UIDVALIDITY assignment now */
> >> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D t=
ime (0);
> >> +@@ -1425,7 +1425,7 @@ void unix_unlock (int fd,MAILSTREAM *stream,DOT=
LOCK *lock)
> >> +     }
> >> +     else now =3D 0;             /* no time change needed */
> >> +                               /* set the times, note change */
> >> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1=
];
> >> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp))=
 LOCAL->filetime =3D tp[1];
> >> +   }
> >> +   flock (fd,LOCK_UN);         /* release flock'ers */
> >> +   if (!stream) close (fd);    /* close the file if no stream */
> >> +@@ -2251,7 +2251,7 @@ long unix_rewrite (MAILSTREAM *stream,unsigned =
long *nexp,DOTLOCK *lock,
> >> +                               /* set atime to now, mtime a second ea=
rlier */
> >> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
> >> +                               /* set the times, note change */
> >> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
> >> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL-=
>filetime =3D tp[1];
> >> +     close (LOCAL->fd);                /* close and reopen file */
> >> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
> >> +                          (long) mail_parameters (NIL,GET_MBXPROTECTI=
ON,NIL)))
> >> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-=
oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> >> index 17faa3aa6..7e3bddb58 100644
> >> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> >> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> >> @@ -16,6 +16,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/imap=
-${PV}.tar.gz \
> >>              file://0002-tmail-Include-ctype.h-for-isdigit.patch \
> >>              file://0001-Fix-Wincompatible-function-pointer-types.patc=
h \
> >>              file://uw-imap-newer-tls.patch \
> >> +           file://uw-imap-fix-incompatible-pointer-types.patch \
> >>              "
> >>
> >>   SRC_URI[md5sum] =3D "2126fd125ea26b73b20f01fcd5940369"
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#110750): https://lists.openembedded.org/g/openembe=
dded-devel/message/110750
> >> Mute This Topic: https://lists.openembedded.org/mt/106526690/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Kai Kang
> Wind River Linux
>

