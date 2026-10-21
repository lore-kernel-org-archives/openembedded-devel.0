Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8735.1792580505267820245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ahTtMhc8;
 spf=pass (domain: konsulko.com, ip: 209.85.167.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso525069e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580503; x=1793185303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cucdrZtkdcvtdLxHgp+B6hM/TfOyYDmMuNDrvEN+PUg=;
        b=ahTtMhc8gdSF/NvgZ8ihzwNI29aaIjMbuf6hrjqooZ0gKefj+y4zNbmDVlj+djqTzc
         5ZPYSZHdqu+QpIDBofb64+tMedwAkj8ZBMRf+hahwc4/iBe125GCcLKSoSsXbGMtARN/
         p/UPqyCKz6+9VJw+7CugY4LEX0TCRPZMvX5ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580503; x=1793185303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cucdrZtkdcvtdLxHgp+B6hM/TfOyYDmMuNDrvEN+PUg=;
        b=lF82wBfJwOiF2Fg9nNF+xMgPt7VBF9fRmgBxIUwKHXUeITnR5YrjEHVtmTf0FTIRdR
         jChasTD78SAyW6ERsadXj2vZ6kuWTBdRlgS+RIve5qYokonysuEDm395H34fPecQ/o/k
         gREfjjZU300s9NIObYCn/JgeToPTLjSLIoVkkydamjYsMp1m4DH1PM1bwCB1rWgPLYHp
         /vNA9gc5L6w126KEbJt7UGP2uHl8+QThBCKk8+cUGiAuPuw7VHy3osEBv6L5EcBS5D+4
         HZc1gPF+y6n5xlkPkmBpCjIFpzF82Y7UDA60JZlX04MkEEIXP+rS8Q0Dx00VXiRyKYsg
         G68Q==
X-Gm-Message-State: AFq9FYLi++fxGZfUEpGVsVmn3+N/DMcsBzXmFvIOpwtIH4wNxwynpngj
	eMGiYsEOMecayyx02kr3MNMjzF1Sh7bBA4KMKBRL3WM0OtVVmaDFZR1aFQ5fgkG4Qk1hXuecq0E
	gabvt
X-Gm-Gg: AYBFou3cfLfCyGNSraE5FelVir5iiSchd/4JXyaOIBFi07tTfyN1MB5TIUdGbVxb/+V
	DParfrdftRjl4LgcCAp/R81GASO55b9DaCTKfiSEjaBn+IwoliaNNMp2P7G7uJQHVnWPN9YQ05t
	zyo4ksvw1FCn4KRbSx1Do2gt7DAXGdXcvUfK1AmmYdYv6GJ4fTfIbsdSgoMedmmKLWlb/xcdw3l
	c3FFieJ+xoAQ/3se20sEKuMR1e1X9nx8o1lG9dHa0KDAOWNqp2Nf+OLy/Dj1BX3G0zCvCUZFF+y
	tOiSchLGcC9GusPCqZUo1WM5Dri0sDCfVuH09v/H7V9PlfuKLNnY3jqa/UE2+fLQcrRCPVjutSG
	Yerp7jfPnltmZs+XFlh72zZ4WRKNLStHw7Hsr+OvYfN/hbqXfT+pDwKU9ivTPjQs35BOcf5djil
	vn4/BsDtK7h7yV4oAxFyS8/xLgSCi+hYBCowbc66Xanjvyhnlf01RM7/b/I2Nj1mc7OYfo3G/t5
	IVfPLciY1Vw3PAHNlJhf87d0q25pA0H9KQsup1dbe7hV6H+ssm6A6fIBymZeB30rYeVpI+o3dmj
	WzyDIPOEeFcSFxy793hPBhDtxtvyK6Gqt2n9r+bxG8Vxg66GBFzIBAwSiXpb3ix6ur36yYrfprW
	T91Cx
X-Received: by 2002:a05:6512:2398:b0:5bc:b774:8a73 with SMTP id 2adb3069b0e04-5be66c776ddmr1650908e87.15.1792580503123;
        Wed, 21 Oct 2026 04:01:43 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/36] python3-huey: Upgrade 3.3.4 -> 3.4.0
Date: Wed, 21 Oct 2026 14:00:42 +0300
Message-ID: <20261021110103.1943456-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131277
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.4.0:

Backwards-incompatible. The django stats app writes to its own sqlite
database by default (huey-stats.db in settings.BASE_DIR), instead of
DATABASES['default']. To keep recording in your main Django database,
specify the database explicitly:

HUEY_STATS['database'] takes a db-url or a peewee Database, or use
HUEY_STATS['filename'] to set the sqlite path. See the Django docs
section for building a peewee database from your existing DATABASES
entry.

The admin *Events* log is now rendered from the stats database through
peewee, rather than being a ModelAdmin via ORM. It is now linked from
the dashboard's *Recent events* heading.

Consumer:

- Add --shutdown-timeout option to bound graceful shutdown time.
- Add --graceful-signal option to allow making SIGTERM the graceful
  shutdown signal (e.g. -g TERM).

User-facing APIs:

- Add ttl to lock_task() and put_if_empty() so locks expire on
  their own. Supported by memory and redis storages, others raise
  NotImplementedError. RedisHuey requires server hash-field TTL
  support (redis 7.4+ or valkey 9+), RedisExpireHuey works on any
  version.
- Add timeout parameter to aget_result().

Small stuff:

- Ensure one raising signal receiver does not prevent the remaining
  receivers from running.
- Fix crontab ranges with a step (0-30/5) and wrap-around ranges
  (22-2, day_of_week='1-7'). Raise ValueError when a field matches
  no values.
- Pass failed chord members to the callback as huey.Error and
  skipped (revoked, expired, cancelled) members as huey.SKIPPED
  instead of a raw exception or None.
- Delete chord partial results explicitly on completion, so they no
  longer linger until expiry on RedisExpireStorage.
- Write the error of a failed pipeline stage to every skipped
  downstream stage, so their Result handles raise instead of
  blocking.
- Accept an explicit id in TaskWrapper.s(), matching schedule().

Storage:

- Skip messages that fail to deserialize in Huey.pending() and
  Huey.scheduled(), logging the error, as read_schedule() already
  does.
- Add clean_name option to RedisHuey (default to True). Specify
  False to stop stripping non-alphanumeric characters from the
  storage namespace. The default will change in a future release.
- Reduce Redis round-trips for peek_data, pop_data and delete_data,
  and make RedisExpireStorage.incr() set the TTL atomically w/ the
  increment.
- Skip the exclusive lock in SqliteStorage.dequeue() when the queue
  is empty, so idle consumers no longer block producers and the
  scheduler.
- Batch the SqliteStorage.read_schedule() delete to avoid sqlite's
  parameter limit when many tasks come due at once. Same fix in
  SqlHuey.
- Order SqliteStorage.read_schedule() and SqlHuey.read_schedule()
  by (timestamp, id), matching PostgresStorage.
- Add queue to the sqlite task index (task_queue_priority_id) so
  queues sharing a file no longer scan each other's rows. The old
  task_priority_id index is dropped when the schema is initialized.
  I'll get rid of the temporary in-band drop in a few releases.
- Add peek_many() to the storage API. Revocation checks now fetch
  the task and task-class keys in one round trip.
- Return str keys from result_items() on every storage backend.
  Redis and File storage previously returned bytes.

Stats:

- Better handling for timeout, locked, rate-limited and retrying in
  stats recorder.
- Log dropped events in the stats recorder instead of failing
  silently.
- Fix stats recorder max_events pruning to count rows per queue.
  With multiple queues sharing a stats db, each queue retained only
  a fraction of the configured cap.
- Add inflight_hours option to stats recorder, replacing the
  hardcoded 6 hour in-flight cutoff.
- Require the change_hueydashboard permission for the django admin
  dashboard's revoke, restore and flush controls. Previously any
  staff user who could view the dashboard could also flush the
  queue.
- Add huey[stats] extra which installs ol' peewee.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_3.3.4.bb => python3-huey_3.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.3.4.bb => python3-huey_3.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb b/meta-python/recipes-devtools/python/python3-huey_3.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.4.0.bb
index a9103cdf9c..282a32afe7 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 
-SRC_URI[sha256sum] = "6de196c6ece2e38b5173f7510600091ab035c0e86b0958d0e5b38a82b9984666"
+SRC_URI[sha256sum] = "ac9b02e741f13da4092ea19bcaafc73669e97d3153914d2fed2868df144f6dfa"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.47.3

